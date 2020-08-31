<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');
require_once JPATH_BASE . '/includes/functions.php';

require_once JPATH_BASE . '/includes/LdapCustom.php';


function sendinvitation() {

    $mailer = JFactory::getMailer();
    $config = JFactory::getConfig();
    $sender = array(
        $config->get( 'mailfrom' ),
        $config->get( 'fromname' )
    );

    $mailer->setSender($sender);
    $recipient = $_POST['mail'];
    $mailer->addRecipient($recipient);
    $mailer->isHTML(true);
    $mailer->Encoding = 'base64';

    $actual_login= JUri::root()."login";//isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://{$_SERVER['HTTP_HOST']}/login";

	$textEmail = $_POST['send-password'] == 1 ? JText::_('TEXT_EMAIL_WITHPASSWORD') : JText::_('TEXT_EMAIL_WITHOUTPASSWORD');
	
	$textEmail = str_replace("{actualLogin}", $actual_login, $textEmail);
	$textEmail = str_replace("{userName}", $_POST['cn'], $textEmail);
	if($_POST['send-password'] == 1) $textEmail = str_replace("{userPassword}", $_POST['userPassword'], $textEmail);
	
	$textSelect = !empty($_POST['passwordgenerate']) ? JText::_('TEXT_EMAIL_OTHER1') : JText::_('TEXT_EMAIL_OTHER2');
	
	$textEmail = str_replace("{other}", $textSelect, $textEmail);

    $mailer->setSubject('Registrazione nuovo account');
    $mailer->setBody($textEmail);

    $send = $mailer->Send();
    if ( $send !== true ) {
        echo 'Error sending email: ' . $send->__toString();
    }
}


/** ============ TUTTE LE PA =================*/
$urlAllPA = GPT_BASE_URL."/rest/RestUserAddOn/getAllPA";

$controlMod = !empty($_GET['idUtente']) ? $_GET['idUtente'] : null;
$controlInsert = !empty($_POST['insert']) ? $_POST['insert'] : false;

function getByURL($url, $debug = false){
    if($debug) echo "<br>DEBUG -> ".$url;
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
    return $json;
}
/** update type_form = 1
 *  insert type_form = 2 */
if(!empty($_POST['type_form'])){
    $ldap = new LdapCustom();
    $_POST['uid'] = $_POST['displayName']." ".$_POST['sn'];

    if($_POST['type_form'] == 1){
        $ldap_response = $ldap->writePerson($_POST);
        $strCompleteOperation = JText::_('USER_MODIFIED');
    }else if($_POST['type_form'] == 2){
		
        $control1 = $ldap->getUser($_POST['mail'],'mail');
        $control2 = $ldap->getUser($_POST['cn']);

        if(empty($control1) && empty($control2)){
			if($_POST['sendEmail'] == "send") sendinvitation();
            $ldap_response = $ldap->writePerson($_POST); // @author paolo martufi
        }else{
            $ldap_response['error'] = true;
			
			if(!empty($control2)) $ldap_response['error_msg'] = JText::_('ERROR_USER_EXIST_CN');
			else if(!empty($control1)) $ldap_response['error_msg'] = JText::_('ERROR_USER_EXIST_EMAIL');
           
        }

        $strCompleteOperation = JText::_('USER_CREATED');
    }
}

$uri = JFactory::getURI();

$returnAnnulla = explode("?",$uri->toString());

$returnAnnulla = $returnAnnulla[0];

?>

<div class="container paddingCustom bottom50">
    <div class="row">
        <div class="col-md-12">
            <h2 class="subtitle_custom"><?= JHtml::_('content.prepare', '{loadmodule breadcrumbs}') ?></h2>
            <h1 class="title_custom">
                <?php if(!empty($controlMod) && empty($strCompleteOperation)):?>
                    <?= JText::_('USER_MODIFY') ?>
                <?php elseif($controlInsert && empty($strCompleteOperation)): ?>
                    <?= JText::_('USER_ADDING') ?>
                <?php else: ?>
                    <?= $this->escape($this->item->title) ?>
                <?php endif; ?>
            </h1>

            <?php if(!empty($strCompleteOperation) && $ldap_response['error'] == false):?>

                <div class="container-fluid alert alert-success">
                    <div class="row">
                        <div class="col-md-12">
                            <?php echo $strCompleteOperation;?>
                        </div>
                    </div>
                </div>

            <?php endif;?>

            <?php
            /*
             * FIX Bug 197
             * @author paolo martufi
             */
            if($ldap_response['error'] == true):?>

                <div class="container-fluid alert alert-danger">
                    <div class="row">
                        <div class="col-md-12">
                            <?php echo $ldap_response['error_msg'];?>
                        </div>
                    </div>
                </div>

            <?php endif;?>

            <?php if((empty($controlMod) && empty($controlInsert)) || !empty($strCompleteOperation)):?>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <button id="buttonModal" type="button" class="btn btn-default btn-custom" data-toggle="modal" data-target="#modificaUtente"><?= JText::_('USER_MODIFY') ?></button>
                        </div>
                        <div class="col-md-6">
                            <form method="POST">
                                <input type="hidden" name="insert" value="1">
                                <button type="submit" class="btn btn-default btn-custom" ><?= JText::_('USER_ADD') ?></button>
                            </form>
                        </div>
                    </div>
                    <!-- Modal -->
                    <div id="modificaUtente" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg modal-custom-big">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title"><?= JText::_('USER_MODIFY') ?></h4>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <form class="row"  method="POST" autocomplete="off">
                                            <input type="hidden" name="find" value="1">
                                            <div class="form-group col-md-6 customLabel">
                                                <label for="user_search_id"><?= JText::_('SEARCH_BY_NAME') ?></label>
                                                <input id="user_search_id" type="text" class="form-control form-controlCustom" name="user_search" value="<?php echo !empty($_POST['user_search']) ? $_POST['user_search'] : "";?>">
                                            </div>

                                            <div class="form-group col-md-6 customLabel">
                                                <label for="id_pa_search_text"><?= JText::_('SEARCH_BY_ORGANIZATION') ?></label>
                                                <input type="text" id="id_pa_search_text" class="form-control form-controlCustom" name="pa_search" onkeyup="showResult(this.value)" value="<?php echo !empty($_POST['pa_search']) && empty($strCompleteOperation) ? $_POST['pa_search'] : "";?>">
                                                <input type="hidden" id="id_pa_search" name="id_pa_search" value="<?php echo !empty($_POST['id_pa_search']) && empty($strCompleteOperation) ? $_POST['id_pa_search'] : "";?>">
                                                <input type="hidden" id="id_cn_pa_search" name="id_cn_pa_search" value="<?php echo $_POST['id_cn_pa_search'];?>">
                                                <div id="livesearch"></div>
                                            </div>

                                            <div class="col-md-6">
                                                <button type="submit" class="btn btn-default btn-custom"><?= JText::_('SEARCH') ?></button>
                                            </div>


                                        </form>
                                    </div>

                                    <?php if($_POST && (!empty($_POST['user_search']) || !empty($_POST['pa_search'])) && (empty($strCompleteOperation) || $_POST['find'])):?>
                                        <script>
                                            jQuery(document).ready(function(){
                                                setTimeout(function () {

                                                    jQuery("#buttonModal").trigger("click");
                                                },500);
                                            });
                                        </script>
                                    <?php

                                    $user = $_POST['user_search'];
                                    $pa = $_POST['id_pa_search'];

                                    $array = array(
                                        "User" =>  $_POST['user_search'],
                                        "PA_ID"   => $_POST['id_pa_search']
                                    );

                                    //var_dump($array);
                                    $urlParameter = "?";
                                    foreach ($array as $key=>$value) {
                                        if (!empty($value) && $value != "") {
                                            if ($urlParameter != "?") $urlParameter .= "&";
                                            $urlParameter .= $key . "=" . $value;
                                        }
                                    }

                                    $urlgetUserFromPa = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/getUserFromPa".$urlParameter;
									
									//var_dump($urlgetUserFromPa);
                                    $arraySearch = getByURL($urlgetUserFromPa);
                                    ?>
                                        <div class="container-fluid detailStatBox paddingCustom containerSearch">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <h2><?= JText::_('USER_SELECT') ?></h2>
                                                        <table id="tableHistoryCustom">
                                                            <thead>
                                                            <tr>
                                                                <th><?= JText::_('USER_NAME') ?></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <?php foreach ($arraySearch as $item):?>
                                                                <tr>
                                                                    <td>
                                                                        <a href="<?php echo JUri::getInstance();?>?idUtente=<?php echo $item['nomeUtente'];?>">
                                                                            <?php echo $item['nomeUtente'];?>
                                                                        </a>
                                                                    </td>

                                                                </tr>

                                                            <?php endforeach;?>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    <?php endif;?>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal"><?= JText::_('CLOSE') ?></button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            <?php else:?>
                <?php

                $user = array();
                if(!empty($controlMod)):


                    $ldap = new LdapCustom();
                    $result = $ldap->getUser($controlMod);

                    //vedo se fa parte del gruppo admin
                    $is_admin = in_array($result['dn'],$ldap->getListGroup());

                    $is_publisher = in_array($result['dn'],$ldap->getListGroup("gpt_publishers"));

                    $dnEnte = $ldap->searchEnte($result['dn']);

					$isRoleEnte = false;
					
                    foreach($dnEnte['owner'] as $item){
                        $isRoleEnte = $item == $result['dn'];
                        if($isRoleEnte) break;
                    }

                    /*var_dump("RISULTATI =");
                    var_dump(json_encode($dnEnte));
                    var_dump($dnEnte['o']);
                    var_dump($dnEnte['ou']);
                    var_dump($dnEnte['cn'][0]);*/


                    $pa_search = $_POST['pa_search'];
                    $id_pa_search =  $_POST['id_pa_search '];
                    $id_cn_pa_search =  $_POST['id_cn_pa_search'];
                    if(empty($pa_search)){
                        $id_pa_search = $dnEnte['o'][0];
                        $pa_search = $dnEnte['ou'][0];
                        $id_cn_pa_search = $dnEnte['cn'][0];
                    }


                    if(empty($result['displayName'])) $result['displayName'] = trim(str_replace( " ".$result['sn'], "", $result['uid']));
                    
                endif;
                ?>
                <div class="container-fluid">

                    <?php $actual_link = explode("?",$_SERVER[REQUEST_URI]);?>

                    <form id="form-update-utente" class="row" action="<?php echo $actual_link[0];?>" method="POST" onsubmit="return isValidForm()">
                        <?php if(!empty($controlMod)):?>
                            <input type="hidden" name="id-user" value="<?php echo $controlMod;?>">
                        <?php endif;?>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="nome-input"><?= JText::_('USER_NAME') ?> *</label>
                                <input type="text" class="form-control form-controlCustom" id="displayName" name="displayName" value="<?php echo $result['displayName'];?>" required>
                            </div>
                            <div class="form-group">
                                <label for="cognome-input"><?= JText::_('USER_LASTNAME') ?> *</label>
                                <input type="text" class="form-control form-controlCustom" id="sn" name="sn" value="<?php echo $result['sn'];?>" required>
                            </div>
                            <div class="form-group">
                                <label for="login-input"><?= JText::_('USER_LOGIN') ?> *  <span class="validation-error-msg" id="username-validation-error-msg"><?= JText::_('USERNAME_VALIDATION_ERROR_MSG')?></span></label>
                                <!--
                                Bug 151
                                <input type="text" class="form-control form-controlCustom" id="cn" name="cn" onkeyup="isAlphaNumeric(this.value)" value="<?php echo $result['cn'];?>" required <?php if(!empty($result['cn'])):?>readonly<?php endif;?>>
                                -->
                                <input type="text" class="form-control form-controlCustom" id="cn" name="cn" value="<?php echo $result['cn'];?>" required <?php if(!empty($result['cn'])):?>readonly<?php endif;?>>

                            </div>
                            <div class="form-group">
                                <label><?= JText::_('USER_TYPE') ?> *</label>

                                <div class="form-group custom-form-group">
                                    <label class="radio-inline">
                                        <input id="rule-publisher" type="checkbox" name="rule-publisher" value="publisher" <?php if(($is_publisher && !empty($controlMod)) || !($is_admin && !empty($controlMod))) echo "checked";?>> <?= JText::_('PUBLISHER') ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input id="rule-admin" type="checkbox" name="rule-admin" value="admin" <?php if($is_admin && !empty($controlMod)) echo "checked";?>> <?= JText::_('ADMIN') ?>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email-input"><?= JText::_('USER_EMAIL') ?> *</label>
                                <input type="email" class="form-control form-controlCustom" id="mail" name="mail" value="<?php echo $result['mail'];?>" required>
                            </div>
                            <div class="form-group">
                                <label for="ente-id_pa_search_text"><?= JText::_('USER_ORGANIZATION') ?> *</label>
                                <input type="text" id="id_pa_search_text" class="form-control form-controlCustom" name="pa_search" onkeyup="showResult(this.value)" value="<?php echo $pa_search;?>" required autocomplete="off">
                                <input type="hidden" id="id_pa_search" name="id_pa_search" value="<?php echo $id_pa_search;?>">
                                <input type="hidden" id="id_cn_pa_search" name="id_cn_pa_search" value="<?php echo $id_cn_pa_search;?>">
                                <div id="livesearch"></div>
                            </div>
                            <div class="form-group">
                                <label><?= JText::_('ORGANIZATION_ROLE') ?> *</label>

                                <div class="form-group custom-form-group">
                                    <label class="radio-inline">
                                        <input type="radio" name="role-ente" value="<?= strtolower(JText::_('USER')) ?>" <?php if(!$isRoleEnte) echo "checked";?>> <?= JText::_('USER') ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="role-ente" value="<?= strtolower(JText::_('REFERENCE')) ?>" <?php if($isRoleEnte) echo "checked";?>> <?= JText::_('REFERENCE') ?>
                                    </label>
                                </div>
                            </div>
							
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="titolo-input"><?= JText::_('USER_TITLE') ?></label>
                                <input type="text" class="form-control form-controlCustom" id="titolo-input" name="title" value="<?php echo $result['title'];?>">
                            </div>
                            <div class="form-group">
                                <label for="settore-input"><?= JText::_('USER_SECTOR') ?></label>
                                <input type="text" class="form-control form-controlCustom" id="settore-input" name="businessCategory" value="<?php echo $result['businesscategory'];?>">
                            </div>
                            <div class="form-group">
                                <label for="website-input"><?= JText::_('USER_WEBSITE') ?></label>
                                <input type="text" class="form-control form-controlCustom" id="website-input" name="labeledURI" value="<?php echo $result['labeleduri'];?>">
                            </div>
                            <div class="form-group">
                                <label for="phone-input"><?= JText::_('USER_PHONE') ?></label>
                                <input type="text" class="form-control form-controlCustom" id="phone-input" name="telephoneNumber" value="<?php echo $result['telephonenumber'];?>">
                            </div>
                            <div class="form-group">
                                <label for="address-input"><?= JText::_('USER_ADDRESS') ?></label>
                                <input type="text" class="form-control form-controlCustom" id="address-input" name="street" value="<?php echo $result['street'];?>">
                            </div>
                            <div class="form-group">
                                <label for="ricerca-regione"><?= JText::_('SEARCH_REGION') ?></label>
                                <select id="ricerca-regione" class="form-control form-controlCustom" name="reg">
                                    <option value="-1"><?= JText::_('SEARCH_REGION') ?>...</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="ricerca-provincia"><?= JText::_('USER_PROVINCE') ?></label>
                                <select class="form-control form-controlCustom" id="ricerca-provincia" name="st">
                                    <option value="-1"><?php echo !empty($result['st']) ? $result['st'] : JText::_('SEARCH_PROVINCE') . "...";?></option>
                                </select>

                                <?php if(!empty($controlMod) && !empty($result['st'])):?><script>jQuery(document).ready(function(){getRegioniByComune("<?php echo $result['st'];?>");});</script><?php endif;?>
                            </div>
                            <div class="form-group">
                                <label for="ricerca-comune"><?= JText::_('USER_DISTRICT') ?></label>
                                <select class="form-control form-controlCustom" id="ricerca-comune" name="l">
                                    <option value="-1"><?php echo !empty($result['l']) ? $result['l'] : JText::_('SEARCH_DISTRICT') . "...";?></option>
                                </select>
                            </div>
                        </div>

                        <?php if(empty($controlMod)):?>
                            <div class="col-md-6">
                                <div class="form-check" style="padding: 10px 0px;">
                                    <input class="form-check-input" type="checkbox" name="passwordgenerate" id="passwordgenerate" checked>
                                    <label class="form-check-label" for="passwordgenerate">
                                        <?php echo JText::_('PASSWORD_GENERATE');?>
                                    </label>
                                </div>
                            </div>
							
							<div class="col-md-2">
                                <div class="form-check" style="padding: 13px 0px;">
                                    <input class="form-check-input" type="checkbox" id="sendEmail" name="sendEmail" value="send" checked>
                                    <label class="form-check-label" for="sendEmail">
                                        <?php echo JText::_('SEND_EMAIL');?>
                                    </label>
                                </div>
                            </div>
							<div class="col-md-4">
                                <div id="send_password" class="form-group" style="padding-top: 10px;">
									<label class="radio-inline">
                                        <input type="radio" name="send-password" value="1" checked> <?= JText::_('WITH_PASSWORD') ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="send-password" value="2"> <?= JText::_('WITHOUT_PASSWORD') ?>
                                    </label>
								</div>
                            </div>
                        <?php endif;?>
                        <div class="col-md-6" style="margin-top: 10px;">
                            <div class="form-group">
                                <label for="password-input"><?= JText::_('PASSWORD') ?> *   <span class="validation-error-msg" id="password-validation-error-msg"><?= JText::_('PASSWORD_VALIDATION_ERROR_MSG')?></span></label>
                                <input type="password" class="form-control form-controlCustom" id="password-input" name="userPassword" <?php if(empty($controlMod)):?>required<?php endif;?>>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group" style="padding: 10px 0;">
                                <label for="repassword-input"><?= JText::_('REPASSWORD') ?> *</label>
                                <input type="password" class="form-control form-controlCustom" id="repassword-input" <?php if(empty($controlMod)):?>required<?php endif;?>>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <?php if(!empty($controlMod)):?>
                                <input type="hidden" name="type_form" value="1">
                            <?php elseif($controlInsert): ?>
                                <input type="hidden" name="type_form" value="2">
                            <?php endif; ?>
                            <div class="form-group">
                                <button type="submit" <?php if($controlInsert): ?>id="insertForm"<?php endif;?> class="btn btn-default btn-custom buttonCustomGest">
                                    <?php if(!empty($controlMod)):?>
                                        <?= JText::_('USER_MODIFY') ?>
                                    <?php elseif($controlInsert): ?>
                                        <?= JText::_('USER_CREATE') ?>
                                    <?php endif; ?>
                                </button>
                                <a href="<?php echo $returnAnnulla;?>" class="btn btn-default btn-custom buttonCustomGest buttonCustomGestLine" ><?= JText::_('ANNULLA') ?></a>
                                <div class="contentLoading">
                                    <i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
                                    <span class="sr-only">Loading...</span> <?= JText::_('LOADING') ?>
                                </div>
                            </div>
                        </div>
                    </form>
                    
                </div>
            <?php endif;?>
        </div>
    </div>
</div>









<!-- LIBRERIE ESRI -->
<link rel="stylesheet" href="https://js.arcgis.com/3.20/esri/css/esri.css">
<script src="https://js.arcgis.com/3.20/"></script>

<script>

    function randomPassword() {
        var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOP1234567890";
        var pass = "pass_";
        for (var x = 0; x < 10; x++) {
            var i = Math.floor(Math.random() * chars.length);
            pass += chars.charAt(i);
        }
        return pass;
    }

    jQuery("#sendEmail").change(function(){
       if(this.checked){
           jQuery("#send_password").show();
       }else{
           jQuery("#send_password").hide();
       }
    });
	
    jQuery("#passwordgenerate").change(function(){
       if(this.checked){
           var pass = randomPassword();
           jQuery("#password-input")[0].value = pass;
           jQuery("#repassword-input")[0].value = pass;
       }else{
           jQuery("#password-input")[0].value = "";
           jQuery("#repassword-input")[0].value = "";
       }
    });
	jQuery("#passwordgenerate").change();
    /** ============= GLOBAL VAR ============= */

    var pathFolder = "<?php echo $baseurls;?>advancedSearch/";
    var debug = true;
    var maxResultSearch = 10;

    require([
        "esri/map", "esri/toolbars/draw", "esri/symbols/SimpleMarkerSymbol",
        "esri/symbols/SimpleLineSymbol","esri/symbols/SimpleFillSymbol", "esri/symbols/PictureFillSymbol",
        "esri/symbols/CartographicLineSymbol", "esri/graphic", "esri/Color",
        "esri/geometry/Geometry", "esri/geometry/Extent", "dojo/dom",
        "esri/geometry/Polygon", "esri/SpatialReference", "dojo/on",
        "dojo/_base/declare", "dojo/_base/lang", "esri/geometry/Point",
        "esri/geometry/webMercatorUtils", "dojo/domReady!"
    ], function(
        Map, Draw, SimpleMarkerSymbol,
        SimpleLineSymbol, SimpleFillSymbol, PictureFillSymbol,
        CartographicLineSymbol, Graphic, Color,
        Geometry, Extent, dom,
        Polygon, SpatialReference, on,
        declare, lang, Point,
        webMercatorUtils
    ) {
        var clazz = declare(null, {
            map: null,
            drawBox: null,

            constructor: function () {
                this.initEvent();

                //carico lista regioni
                this.getRegioni();
            },

            initEvent: function () {
                var cuADV = this;

                jQuery('#ricerca-regione').on('change', function() {

                    cuADV.cleanSelection(false,true,true);
                    if(this.value != -1){
                        var option = jQuery(this).find(":selected")[0];
                        var cod_reg = option.attributes['data-cod-reg'].value;
                        cuADV.getProvince(cod_reg);
                    }

                });

                jQuery('#ricerca-provincia').on('change', function() {

                    cuADV.cleanSelection(false,false,true);
                    if(this.value != -1) {
                        var option = jQuery(this).find(":selected")[0];

                        var cod_reg = option.attributes['data-cod-reg'].value;
                        var cod_pro = option.attributes['data-cod-pro'].value;
                        cuADV.getComuni(cod_reg, cod_pro);
                    }

                });

                jQuery('#ricerca-comune').on('change', function() {

                    if(this.value != -1){
                        var option = jQuery(this).find(":selected")[0];

                        var cod_reg = option.attributes['data-cod-reg'].value;

                    }

                });

                jQuery("#cn").click(function(){
                    /*
                     * Bug 198
                     * Se il nome o il cognome contegono caratteri accentati, questi vengono inseriti nello username
                     *
                     * FIX
                     * Sostituzione di tutti i caratteri accentati nelle stringhe del nome e del cognome
                     * @author paolo martufi 2017-07-10
                     */
                    var nome = sostituisciAccenti( jQuery("#displayName")[0].value.replace(/\s/g, '').toLowerCase() );
                    var cognome = sostituisciAccenti( jQuery("#sn")[0].value.replace(/\s/g, '').toLowerCase() );

                    jQuery("#cn")[0].value = nome+"."+ cognome;
                });

            },


            /** ============= AGGIORNAMENTO SELECT AREA GEOGRAFICA ============= */

            orderA: function(array, key){
                return array.sort(function(a, b) {
                    var x = a.attributes[key]; var y = b.attributes[key];
                    return ((x < y) ? -1 : ((x > y) ? 1 : 0));
                });
            },

            getRegioni: function(){
                var that = this;
                var file = pathFolder+"Regioni/Regioni.json";
                var selectObject = jQuery("#ricerca-regione");

                jQuery.getJSON( file, function( data ) {

                    jQuery("#loadingSelect").fadeOut(1000);
                    var arraySup = data.features;
                    if(arraySup.length != 0 ){
                        jQuery.each(that.orderA(arraySup,"NOME_REG"), function (i, item) {
                            var attributes = item.attributes;

                            selectObject.append(jQuery('<option>', {
                                value: attributes['COD_REG'],
                                text : attributes['NOME_REG'],
                                "data-id": attributes['OBJECTID'],
                                "data-cod-reg": attributes['COD_REG']
                            }));
                        });
                    }

                });
            },

            getProvince: function(cod_reg){
                var that = this;
                var file = pathFolder+"Province/Province.json";
                var selectObject = jQuery("#ricerca-provincia");

                jQuery.getJSON( file, function( data ) {

                    var arraySup = data.features;
                    if(arraySup.length != 0 ){
                        jQuery.each(that.orderA(arraySup,"NOME_PRO"), function (i, item) {
                            var attributes = item.attributes;

                            if(attributes['COD_REG'] == cod_reg){
                                selectObject.append(jQuery('<option>', {
                                    value: attributes['NOME_PRO'],
                                    text : attributes['NOME_PRO'],
                                    "data-id": attributes['OBJECTID'],
                                    "data-cod-reg": attributes['COD_REG'],
                                    "data-cod-pro": attributes['COD_PRO']
                                }));
                            }

                        });
                    }

                });
            },

            getComuni: function(cod_reg,cod_pro){
                var that = this;
                var file = pathFolder+"Comuni/"+this.getNameFileComuni(cod_reg)+".json";
                var selectObject = jQuery("#ricerca-comune");
                this.cleanSelection(false,false,true);

                jQuery.getJSON( file, function( data ) {

                    jQuery("#loadingSelect").fadeOut(1000);
                    var arraySup = data.features;
                    if(arraySup.length != 0 ){
                        jQuery.each(that.orderA(arraySup,"NOME_COM"), function (i, item) {
                            var attributes = item.attributes;

                            if(attributes['COD_PRO'] == cod_pro){
                                selectObject.append(jQuery('<option>', {
                                    value: attributes['NOME_COM'],
                                    text : attributes['NOME_COM'],
                                    "data-id": attributes['OBJECTID'],
                                    "data-pro-com": attributes['PRO_COM'],
                                    "data-cod-reg": attributes['COD_REG'],
                                    "data-cod-pro": attributes['COD_PRO']
                                }));
                            }

                        });

                    }

                });
            },

            cleanSelection: function(controlReg,controlPro,controlCom){
                var selectObject;
                if(controlReg){
                    selectObject = jQuery("#ricerca-regione");
                    selectObject.empty();
                    selectObject.append(jQuery('<option>', {
                        value: -1,
                        text : "<?= JText::_('SEARCH_REGION') ?>..."
                    }));
                }

                if(controlPro){
                    selectObject = jQuery("#ricerca-provincia");
                    selectObject.empty();
                    selectObject.append(jQuery('<option>', {
                        value: -1,
                        text : "<?= JText::_('SEARCH_PROVINCE') ?>..."
                    }));
                }

                if(controlCom){
                    selectObject = jQuery("#ricerca-comune");
                    selectObject.empty();
                    selectObject.append(jQuery('<option>', {
                        value: -1,
                        text : "<?= JText::_('SEARCH_DISTRICT') ?>..."
                    }));
                }

            },

            getNameFileComuni: function(n){
                var str = "";
                if(parseInt(n) < 10){
                    str += "00"+n;
                }else if(parseInt(n) > 100){
                    str += n;
                }else{
                    str += "0"+n;
                }
                return str;
            }

        });

        window.functionMap = new clazz();
    });

    jQuery("#buttonModal").click(function(e){
        e.preventDefault();
        //e.stopPropagation();
        jQuery("#modificaUtente").addClass("in");
        jQuery("#modificaUtente").show();
        jQuery('#main').removeAttr('style');
    });

    jQuery( "#id_pa_search_text" ).click(function() {
        jQuery("#id_pa_search_text")[0].value = "";
        jQuery("#id_cn_pa_search")[0].value = "";
        jQuery("#id_pa_search")[0].value = "";
    });

    jQuery( "#id_pa_search_text" ).focusout(function() {
        unfocusResultPA();
        if(!jQuery("#id_pa_search")[0].value){
            jQuery("#id_pa_search_text")[0].value = "";
        }

        if(!jQuery("#id_pa_search_text")[0].value){
            jQuery("#id_cn_pa_search")[0].value = "";
            jQuery("#id_pa_search")[0].value = "";
        }
    });

    function isValidForm(){
        /*
         * FIX: Bug 151
         * @author paolo martufi 2017-07-06
         */
        if(!validateUsername()){
            alert("<?= JText::_('Username_VALIDATION_ERROR_MSG') ?>");
            return false;
        } else if(!validatePassword()){
            alert("<?= JText::_('PASSWORD_VALIDATION_ERROR_MSG') ?>");
            return false;
        }else if(jQuery("#password-input")[0].value != jQuery("#repassword-input")[0].value) {
            alert("<?= JText::_('PASSWORDS_DO_NOT_MATCH') ?>");
            return false;
        }else if(jQuery("#rule-admin")[0].checked == false && jQuery("#rule-publisher")[0].checked == false){
            alert("<?= JText::_('CHECK_VALIDATION_ERROR_MSG') ?>");
            return false;
        }else{
            //jQuery('#form-update-utente').hide();
            jQuery('.contentLoading').show();
            return true;
        }

    }

    function unfocusResultPA() {
        setTimeout(function(){
            jQuery("#livesearch").empty();
            jQuery('#livesearch').hide();
        },300);

    }

    function isAlphaNumeric(str) {
        var code, i, len;

        for (i = 0, len = str.length; i < len; i++) {
            code = str.charCodeAt(i);
            if (!(code > 47 && code < 58) && // numeric (0-9)
                !(code > 64 && code < 91) && // upper alpha (A-Z)
                !(code > 96 && code < 123)) { // lower alpha (a-z)
                //alert("Errore, login utente deve essere alpanumerico");
            }
        }
        return true;
    }

    function getRegioniByComune(name){
        var that = this;
        var file = pathFolder+"Province/Province.json";
        var selectObject = jQuery("#ricerca-provincia");

        jQuery.getJSON( file, function( data ) {

            var arraySup = data.features;
            if(arraySup.length != 0 ){
                jQuery.each(arraySup, function (i, item) {
                    var attributes = item.attributes;

                    if(attributes['NOME_PRO'] == name){

                        setTimeout(function(){
                            var nSelected = 0;
                            jQuery('#ricerca-regione > option').each(function(n,elem){
                                console.log(elem);
                                if(elem.attributes['data-cod-reg']){
                                    if(parseInt(elem.attributes['data-cod-reg'].value) == attributes['COD_REG']){
                                        nSelected = n+1;
									
										jQuery('#ricerca-regione option:nth-child('+nSelected+')').attr('selected', 'selected');
                                    }
                                }
                            });


                        },500);

                    }

                });
            }

        });
    }

    function showResult(str) {
        if (str.length>=3) {
            jQuery("#livesearch").empty();

            jQuery.get( "<?php echo $urlAllPA;?>?nome="+str, function( data ) {
                var dataParse = JSON.parse(data);
                var arraySup = [];
                if(dataParse.length != 0){
					
					jQuery("#livesearch").empty();
                    jQuery.each(dataParse, function( i,item ) {
                        if(maxResultSearch >= i){//item.nomePA.toLowerCase().indexOf(str.toLowerCase()) != -1 &&
                            arraySup.push(item);

                            var textDiv = jQuery('<div>', {
                                "class" : "box-pa-list",
                                "data-id": item.id,
                                "data-title":item.nomePA,
                                "data-cnPA":item.cnPA,
                                "text":item.nomePA
                            }).click(function (event) {
                                var option = jQuery(this)[0];
                                var idPa = option.attributes['data-id'].value;
                                var cnPA = option.attributes['data-cnPA'].value;
                                var title = option.attributes['data-title'].value;
                                jQuery('[name=id_pa_search]')[0].value = idPa;
                                jQuery('[name=id_cn_pa_search]')[0].value = cnPA;
                                jQuery('[name=pa_search]')[0].value = title;
                            });

                            jQuery("#livesearch").append(textDiv);
                        }
                    });
                }else{
                    jQuery("#livesearch").html('<?= JText::_('NO_RESULTS') ?>');
                    jQuery("#id_cn_pa_search")[0].value = "";
                    jQuery("#id_pa_search")[0].value = "";

                }


                jQuery('#livesearch').show();
                if(debug) console.log(arraySup);

            });
        }
    }


    jQuery('#tableHistoryCustom').dataTable({
        "language": {
            "sEmptyTable":     "<?= JText::_('EMPTY_TABLE') ?>",
            "sInfo":           "<?= JText::_('DATA_TABLE_S_INFO') ?>",
            "sInfoEmpty":      "<?= JText::_('DATA_TABLE_S_INFO_EMPTY') ?>",
            "sInfoFiltered":   "<?= JText::_('DATA_TABLE_S_INFO_FILTERED') ?>",
            "sInfoPostFix":    "",
            "sInfoThousands":  ".",
            "sLengthMenu":     "<?= JText::_('DATA_TABLE_S_LENGTH_MENU') ?>",
            "sLoadingRecords": "<?= JText::_('LOADING') ?>...",
            "sProcessing":     "<?= JText::_('PROCESSING') ?>...",
            "sSearch":         "<?= JText::_('SEARCH') ?>:",
            "sZeroRecords":    "<?= JText::_('NO_RESULTS') ?>",
            "oPaginate": {
                "sFirst":      "<?= JText::_('FIRST') ?>",
                "sPrevious":   "<?= JText::_('PREVIOUS') ?>",
                "sNext":       "<?= JText::_('NEXT') ?>",
                "sLast":       "<?= JText::_('LAST') ?>"
            },
            "oAria": {
                "sSortAscending":  ": <?= JText::_('SORT_ASC') ?>",
                "sSortDescending": ": <?= JText::_('SORT_DESC') ?>"
            }
        }
    });

    /*
     * Bug 151
     * Il campo Password permette l'inserimento di qualsiasi tipo di carattere,
     * mentre sono ammessi solo gli alpanumeri e _
     *
     * FIX
     * Controllo sull'input e confronto con l'epressione regolare
     */
    function validatePassword()
    {
        var re = /^[a-zA-Z0-9_]*$/;
        var validation = re.test(jQuery('#password-input').val());
        return validation;
    }

    jQuery('#password-input').keyup(function(e)
    {

        if( !validatePassword() ){
            jQuery('#password-validation-error-msg').show();
        }
        else{
            jQuery('#password-validation-error-msg').hide();
        }
    });

    function validateUsername()
    {
        var re = /^[a-zA-Z0-9_.]*$/;
        var validation = re.test(jQuery('#cn').val());
        return validation;
    }

    jQuery('#cn').keyup(function(e){
        if( !validateUsername() ){
            jQuery('#username-validation-error-msg').show();
        }
        else{
            jQuery('#username-validation-error-msg').hide();
        }
    });

    /*
     * Sostituisce in una stringa i caratteri accentati
     * @author paolo martufi 2017-07-10
     */
    var sostituisciAccenti = (function () {
        var a = ['À', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Æ', 'Ç', 'È', 'É', 'Ê', 'Ë', 'Ì', 'Í', 'Î', 'Ï', 'Ð', 'Ñ', 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ø', 'Ù', 'Ú', 'Û', 'Ü', 'Ý', 'ß', 'à', 'á', 'â', 'ã', 'ä', 'å', 'æ', 'ç', 'è', 'é', 'ê', 'ë', 'ì', 'í', 'î', 'ï', 'ñ', 'ò', 'ó', 'ô', 'õ', 'ö', 'ø', 'ù', 'ú', 'û', 'ü', 'ý', 'ÿ', 'Ā', 'ā', 'Ă', 'ă', 'Ą', 'ą', 'Ć', 'ć', 'Ĉ', 'ĉ', 'Ċ', 'ċ', 'Č', 'č', 'Ď', 'ď', 'Đ', 'đ', 'Ē', 'ē', 'Ĕ', 'ĕ', 'Ė', 'ė', 'Ę', 'ę', 'Ě', 'ě', 'Ĝ', 'ĝ', 'Ğ', 'ğ', 'Ġ', 'ġ', 'Ģ', 'ģ', 'Ĥ', 'ĥ', 'Ħ', 'ħ', 'Ĩ', 'ĩ', 'Ī', 'ī', 'Ĭ', 'ĭ', 'Į', 'į', 'İ', 'ı', 'Ĳ', 'ĳ', 'Ĵ', 'ĵ', 'Ķ', 'ķ', 'Ĺ', 'ĺ', 'Ļ', 'ļ', 'Ľ', 'ľ', 'Ŀ', 'ŀ', 'Ł', 'ł', 'Ń', 'ń', 'Ņ', 'ņ', 'Ň', 'ň', 'ŉ', 'Ō', 'ō', 'Ŏ', 'ŏ', 'Ő', 'ő', 'Œ', 'œ', 'Ŕ', 'ŕ', 'Ŗ', 'ŗ', 'Ř', 'ř', 'Ś', 'ś', 'Ŝ', 'ŝ', 'Ş', 'ş', 'Š', 'š', 'Ţ', 'ţ', 'Ť', 'ť', 'Ŧ', 'ŧ', 'Ũ', 'ũ', 'Ū', 'ū', 'Ŭ', 'ŭ', 'Ů', 'ů', 'Ű', 'ű', 'Ų', 'ų', 'Ŵ', 'ŵ', 'Ŷ', 'ŷ', 'Ÿ', 'Ź', 'ź', 'Ż', 'ż', 'Ž', 'ž', 'ſ', 'ƒ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ǎ', 'ǎ', 'Ǐ', 'ǐ', 'Ǒ', 'ǒ', 'Ǔ', 'ǔ', 'Ǖ', 'ǖ', 'Ǘ', 'ǘ', 'Ǚ', 'ǚ', 'Ǜ', 'ǜ', 'Ǻ', 'ǻ', 'Ǽ', 'ǽ', 'Ǿ', 'ǿ'];
        var b = ['A', 'A', 'A', 'A', 'A', 'A', 'AE', 'C', 'E', 'E', 'E', 'E', 'I', 'I', 'I', 'I', 'D', 'N', 'O', 'O', 'O', 'O', 'O', 'O', 'U', 'U', 'U', 'U', 'Y', 's', 'a', 'a', 'a', 'a', 'a', 'a', 'ae', 'c', 'e', 'e', 'e', 'e', 'i', 'i', 'i', 'i', 'n', 'o', 'o', 'o', 'o', 'o', 'o', 'u', 'u', 'u', 'u', 'y', 'y', 'A', 'a', 'A', 'a', 'A', 'a', 'C', 'c', 'C', 'c', 'C', 'c', 'C', 'c', 'D', 'd', 'D', 'd', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'G', 'g', 'G', 'g', 'G', 'g', 'G', 'g', 'H', 'h', 'H', 'h', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'IJ', 'ij', 'J', 'j', 'K', 'k', 'L', 'l', 'L', 'l', 'L', 'l', 'L', 'l', 'l', 'l', 'N', 'n', 'N', 'n', 'N', 'n', 'n', 'O', 'o', 'O', 'o', 'O', 'o', 'OE', 'oe', 'R', 'r', 'R', 'r', 'R', 'r', 'S', 's', 'S', 's', 'S', 's', 'S', 's', 'T', 't', 'T', 't', 'T', 't', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'W', 'w', 'Y', 'y', 'Y', 'Z', 'z', 'Z', 'z', 'Z', 'z', 's', 'f', 'O', 'o', 'U', 'u', 'A', 'a', 'I', 'i', 'O', 'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'A', 'a', 'AE', 'ae', 'O', 'o'];
        return function (str) {
            var i = a.length;
            while (i--) str = str.replace(a[i], b[i]);
            return str;
        };
    }());


</script>

<style>

    #livesearch{
        display: none;
        z-index: 10;
        background: #f2f2f2;
        height: auto;
        position: absolute;
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc!important;
    }

    #livesearch > div{
        cursor: pointer;
        padding: 5px 0px;
        font-weight: bold;
    }

    #livesearch > div:hover{
        text-decoration: underline;
    }

    .btn-user{
        color: #333;
        background-color: #fff;
        border-color: #ccc;
        padding: 5px 10px;
        font-size: 1em;
        line-height: 1.5;
        border-radius: 3px;
    }

    .modal-custom-big{
        width:90%;
    }

    .modal-custom-big > div{
        height: 100%;
    }

    .buttonCustomGest{
        margin-top: 20px!important;
        height: 45px;
    }
	
    .buttonCustomGestLine{
        line-height:25px;
    }
    .buttonCustomGest:hover{
        margin-top: 20px;
        height: 45px;
    }

    .custom-form-group{
        margin-top: 10px;
        height: 35px;
    }

    .containerSearch{
        overflow: auto;
        display: block;
        /*max-height: 340px;*/
    }

    .validation-error-msg{
        display: none;
        color: red;
    }
    .contentLoading{
        display: none;
        position: absolute;
        top: 0px;
        left: 0px;
        width: 100%;
        height: 100%;
        z-index: 999;
        background: #fff;
        text-align: center;
        line-height: 50px;
    }

</style>