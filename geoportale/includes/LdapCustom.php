<?php

/*

$ldapHost = "ldap://localhost";
$ldapPort = "389";
$ldapUser ="cn=Manager,dc=maxcrc,dc=com";
$ldapPswd ="secret";
*/
class LdapCustom{
    private $cn;
    private $configSearch;
    private $configSearchEnte;
    const BASE_DN = "dc=RNDT,dc=com";
    const BASE_USER = "ou=Users,ou=People";
    const BASE_ENTE = "ou=Ente,ou=People";
    const BASE_GROUP = "ou=Groups,ou=People";

    public function __construct(){
        $config = JFactory::getConfig();
        $this->authServer = $config->get('auth_server_ldap');
        $this->cn = ldap_connect($config->get('ldap_rndt_server'), $config->get('ldap_rndt_port')) or die("Can't establish LDAP connection");
        //todo mettere variabili base da config
        ldap_set_option($this->cn,LDAP_OPT_PROTOCOL_VERSION,3);
        $this->bind();
        $this->setConfig();
    }

    private function setConfig(){
        $this->configSearch = array(
            "dn"                => "str",//"identificativo",
            "cn"                => "str",//"Login utente",
            "displayName"       => "array",//"Nome",
            "sn"                => "str",//"Cognome",
            "uid"               => "str",//"Nome e Cognome",
            "mail"              => "array",//"Mail",
            "o"                 => "array",//"Azienda", tipo per ente
            "street"            => "array",//"Via",
            "telephoneNumber"   => "array",//"Telefono",
            "userPassword"      => "str",//"Password",
            "st"                => "array",//"Provincia",
            "l"                 => "array",//"Comune",
            "labeledURI"        => "array",//"Sito web",
            "businessCategory"  => "array",//"Settore",
            "title"             => "array",//"Titolo",
            "ou"                => "array",//"nome per ente",
            "codiceTipo"        => "tipo",//"tipo per ente
            "owner"             => "str"
        );

    }

    public function bind(){
        $config = JFactory::getConfig();
        $ldapbind = ldap_bind($this->cn,$config->get('ldap_rndt_username'),$config->get('ldap_rndt_password')) or die("Can't bind to LDAP server.");
    }

    public function close(){
        ldap_close($this->cn);
    }

    public function writePerson($post){

        $supObj = array();
        $supObj["objectclass"] = array();
        $supObj["objectclass"][0] = "inetOrgPerson";
        $supObj["objectclass"][1] = "organizationalPerson";
        $supObj["objectclass"][2] = "person";
        $supObj["objectclass"][3] = "top";

        //$supObj["uid"] = "top";
		if(!empty($post['pa_search'])){
			$post["o"] = $post["pa_search"];
		}
        foreach ($post as $key => $value){
            if(!empty($value) && $value != "-1" && $value != -1){
                foreach ($this->configSearch as $confKey=>$confValue){

                    if($confKey == $key && !empty($value)){
                        if($confValue == "str")
                            $supObj[$key] = $value;
                        else
                            $supObj[$key] = array($value);
                    }
                }
            }

        }
        $dn = "cn=".$supObj['cn'].",".self::BASE_USER.",".self::BASE_DN;

        if(!empty($post['id_cn_pa_search']))
            $this->searchAndAddUser($dn,$post['id_cn_pa_search'],$post['role-ente'] == "riferimento");

        if(empty($supObj['cn']))
            die("Non esiste cn");
        if($post['type_form'] == 1){//update
            $this->modify($dn,$supObj);
            $this->modifyGroup($dn,$post);
			
			return $this->callGeoportalUpdateUser($dn,$post['id_cn_pa_search']);
        } else if($post['type_form'] == 2){//insert

            /*
             * FIX: Bug 197
             * @author paolo martufi 2017-07-07
             */
            $res = $this->add($dn,$supObj);

            if($res['error'])
                return $res;

            $this->modifyGroup($dn,$post);
            
            //$actual_login= (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://{$_SERVER['HTTP_HOST']}/login";

            return $this->callGeoportalInsertUser($dn,$supObj,$post['id_cn_pa_search']);
        }
    }

    public function writeEnte($post){

        $supObj = array();
        $supObj["objectclass"] = array();
        $supObj["objectclass"][0] = "groupOfUniqueNames";
        $supObj["objectclass"][1] = "top";

        $supObj["uniqueMember"] = array();
        $supObj["uniqueMember"][0] = "cn=NULLUSER,".self::BASE_USER.",".self::BASE_DN;

        $idPa = null;
        foreach ($post as $key => $value){
            $control = true;
            if($key == 'dn') $control = false;
            if($key == 'idPa'){
                $idPa = $value;
                $control = false;
            }
            if(!empty($value) && $value != "-1" && $value != -1 && $control){
                foreach ($this->configSearch as $confKey=>$confValue){

                    if($confKey == $key && !empty($value)){
                        if($confValue == "str")
                            $supObj[$key] = $value;
                        else
                            $supObj[$key] = array($value);
                    }
                }
            }

        }

        if($post['dn']) unset($supObj['dn']);

        $dn =  "cn=".$supObj['cn'].",".self::BASE_ENTE.",".self::BASE_DN;

        if($post['dn'] && $post['dn'] != $dn) $this->rename($post['dn'],"cn=".$supObj['cn']);

        if(empty($supObj['cn']))
            die("Non esiste cn");

        if($post['type_form'] == 1){//update

            $ente = $this->getSingle($supObj['cn'],"cn", self::BASE_ENTE.",", false);

            for($i = 0; $i < count($ente["uniquemember"]); $i++){
                if(!empty($ente["uniquemember"][$i])){

                    $supObj["uniqueMember"][$i] = $ente["uniquemember"][$i];
                }
            }

            $this->modify($dn,$supObj);

            return $this->callGeoportalModifyEnte($post['ou'],$post['cn'],$post['tipo'],$post['o'],$idPa);
        } else if($post['type_form'] == 2){//insert

            /*
             * FIX: Bug 197
             * @author paolo martufi 2017-07-07
             */
            $res = $this->add($dn,$supObj);
            if($res['error'])
                return $res;


            $dnAdmin = "cn=NULLUSER,".self::BASE_USER.",".self::BASE_DN;
            $this->searchAndAddUser($dnAdmin,$supObj['cn'],false, $searchNullUser = false);


            return $this->callGeoportalInsertEnte($post['ou'],$post['cn'],$post['tipo'],$post['o']);
        }
    }

    private function rename($dn,$newDn){

        ldap_rename($this->cn, $dn, $newDn, null, true);
    }

    private function add($dn,$info){
        /*
         * Bug: 197
         * non viene gestito l'errore ma visualizzata una pagina bianca

            ldap_add($this->cn, $dn, $info) or die("Cannot insert object class -> ".ldap_err2str(ldap_errno($this->cn)));
         */

        /*
         * FIX
         * @author paolo martufi 2017-07-07
         */
        ldap_add($this->cn, $dn, $info);

        if(ldap_err2str(ldap_errno($this->cn)) != "" && ldap_err2str(ldap_errno($this->cn)) !== "Success")
            return [
                "error"     => true,
                "error_msg" => "Cannot insert object class -> ".ldap_err2str(ldap_errno($this->cn))
            ];

        return ["error" => false];
    }

    private function modify($dn,$info){
        ldap_modify($this->cn, $dn, $info) or die("Cannot modify object class -> ".ldap_error($this->cn));
    }

    private function callGeoportalInsertUser($dn,$obj,$cnPa){
        $url = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/insertUser?user=".urlencode($obj['cn'])."&dn=".urlencode($dn)."&cnPa=".urlencode($cnPa);
        return $this->callUrlGet($url);
    }
	
    private function callGeoportalUpdateUser($dn,$cnPa){
		if(empty($dn) || empty($cnPa)) return ["error" => false];
        $url = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/updateUser?dn=".urlencode($dn)."&cnPa=".urlencode($cnPa);
        return $this->callUrlGet($url);
    }


    private function callGeoportalModifyEnte($nome,$codiceipa,$tipo,$codiceTipo,$idPa){
        $url = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/updatePA?nome=".urlencode($nome)."&idPA=".urlencode($idPa)."&codiceipa=".urlencode($codiceipa)."&tipo=".urlencode($tipo)."&codiceTipo=".urlencode($codiceTipo);
        return $this->callUrlGet($url);
    }

    private function callGeoportalInsertEnte($nome,$codiceipa,$tipo,$codiceTipo){
        $url = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/insertPA?nome=".urlencode($nome)."&codiceipa=".urlencode($codiceipa)."&tipo=".urlencode($tipo)."&codiceTipo=".urlencode($codiceTipo);
        return $this->callUrlGet($url);
    }

    private function callUrlGet($url){

        $url .="&auth=".$this->authServer;//per chiamate lato server autenticazione
        $opts = array(
            'http'=>array(
                'method'=>"GET",
                'header'=>"Accept-language: en\r\n" .
                    "Cookie: foo=bar\r\n"
            )
        );
        $context = stream_context_create($opts);
        $html = file_get_contents($url,false,$context);
        $json = preg_replace('/,\s*([\]}])/m', '$1', $html);
        $json = json_decode($json,true);

        if ((isset($json["insert"]) && $json["insert"] === "Ok") || (isset($json["update"]) && $json["update"] === "Ok"))
            return ["error" => false];
        else{
            return [
                "error"     => true,
                "error_msg" => $html
            ];
        }
    }



    private function searchAndAddUser($dn,$cnEnte,$is_admin = false, $searchUser = true){
        $ente = $this->getSingle($cnEnte,"cn", self::BASE_ENTE.",", false);

        if($searchUser) $this->removeOtherUniqueMember($dn);

        $le       = array();
        $arraySup = array();
        foreach($ente["uniquemember"] as $key=>$value)
            if(!is_int($value)) array_push($arraySup,$value);
        array_push($arraySup,$dn);

        $le["uniqueMember"] = array_unique($arraySup);

        if($is_admin){//aggiungo utente come admin

            $arraySup = array();
            foreach($ente["owner"] as $key=>$value)
                if(!is_int($value)) array_push($arraySup,$value);
            array_push($arraySup,$dn);

            $le["owner"] = array_unique($arraySup);
        }

        if(!empty($ente["dn"])){
            $this->modify($ente["dn"],$le);
        }


    }

    private function removeOtherUniqueMember($dnUser){
        $ente = $this->searchEnte($dnUser);
        $le       = array();
        $arraySupuniquemember = array();
        $arraySupowner = array();

        foreach($ente["uniquemember"] as $key=>$value)
            if(!is_int($value) && $value != $dnUser) array_push($arraySupuniquemember,$value);

        foreach($ente["owner"] as $key=>$value)
            if(!is_int($value) && $value != $dnUser) array_push($arraySupowner,$value);

        $le["uniqueMember"] = array_unique($arraySupuniquemember);
        $le["owner"] = array_unique($arraySupowner);

		//fix non può esistere un ente senza utenti 09-01-2020
		if(count($le["uniqueMember"]) === 0) $le["uniqueMember"] = array("cn=NULLUSER,".self::BASE_USER.",".self::BASE_DN);

        if(!empty($ente["dn"])){
            $this->modify($ente["dn"],$le);
        }
    }

    private function addRemoveGroup($dn, $cn, $addRemove){//true add, false remove
        $group = $this->getSingle($cn,"cn", self::BASE_GROUP.",", false);

        $le       = array();
        $arraySup = array();
        foreach($group["uniquemember"] as $key=>$value)
            if(!is_int($value) && $value != $dn) array_push($arraySup,$value);
        if($addRemove) array_push($arraySup,$dn);

        $le["uniqueMember"] = array_unique($arraySup);

        if(!empty($group["dn"])){
            $this->modify($group["dn"],$le);//todo non va errore modifica ente
        }
    }


    private function modifyGroup($dn,$post){

        if(!empty($post['rule-publisher']) || !empty($post['rule-admin']) ){
            $this->addRemoveGroup($dn,"gpt_publishers",$post['rule-publisher'] == "publisher");
            $this->addRemoveGroup($dn,"gpt_administrators",$post['rule-admin'] == "admin");

			
            $user = JFactory::getUser($post['cn']);
            $userId = $user->id;
			
            //jomla group
            if($post['rule-admin'] == "admin"){
                JUserHelper::setUserGroups($userId, array(2,8));
            }else{
				JUserHelper::removeUserFromGroup($userId,8);
				JUserHelper::setUserGroups($userId, array(2));
			}

		}
    }

    public function searchEnte($dnUser){
        $supportList = $this->getListEnti();
        for($i = 0; $i <= count($supportList); $i++){
            if(in_array($dnUser,$supportList[$i]['uniquemember'])){

                return $supportList[$i];
            }
        }
    }

    public function getListEnti(){
        $info = $this->search("*", "cn", self::BASE_ENTE.",");

        $supportList = array();
        for($i = 0; $i <= $info['count']; $i++){
            if($info[$i])array_push($supportList,$info[$i]);
        }

        return $supportList;
    }

    public function getListGroup($text = "gpt_administrators", $serachIn = "cn"){
        $info = $this->search($text, $serachIn);

        $item  = $info[0]['uniquemember'];

        $supportList = array();
        for($i = 0; $i <= $item['count']; $i++){
            if($item[$i])array_push($supportList,$item[$i]);
        }

        return $supportList;
    }

    public function getUser($text,$searchIn = "cn"){
        return $this->getSingle($text,$searchIn,self::BASE_USER.",");
    }

    public function getEnte($text,$searchIn = "cn"){
        return $this->getSingle($text,$searchIn,self::BASE_ENTE.",");
    }

    private function getSingle($text, $searchIn, $addBase = "", $configPar = true){
		
        $info = $this->search($text, $searchIn, $addBase);

        if(count($info["count"]) != 0){

            $item = $info[0];

            if($configPar){
                $supObj = array();
                foreach ($this->configSearch as $key=>$value){
                    $key = strtolower($key);
                    if(!empty($item[$key]) && !empty($item[$key][0])){
                        $supObj[$key] = is_array ($item[$key]) ? $item[$key][0] : $item[$key];
                    }
                }
                return $supObj;
            }else{
                return $item;
            }
        }
    }

    public function search($text, $serachIn = "cn", $addBase = ""){
        $basedn = $addBase.self::BASE_DN;
        $filter = "(".$serachIn."=".$text.")";
        $search = ldap_search($this->cn,$basedn,$filter) or exit("Unable to search ldap server");
        return ldap_get_entries($this->cn, $search);
    }

    public function searchCustom($textFilter, $basedn = self::BASE_DN){
        $search = ldap_search($this->cn,$basedn,$textFilter) or exit("Unable to search ldap server");
        return ldap_get_entries($this->cn, $search);

    }
}




?>
