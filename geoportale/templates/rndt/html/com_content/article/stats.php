<?php


header('Content-Type: text/html; charset=utf-8');
// No direct access to this file
defined('_JEXEC') or die('Restricted access');

function replaceForKey($text){
    $text = str_replace("'","",$text);
    //return iconv('UTF-8','ASCII//TRANSLIT',str_replace("'","",$text));
    return md5($text);
}

function exceptionTextTranslate($text){
    $slow = strtolower($text);
    if($slow == "dataset" || $slow == "005") return "dataset";
    if($slow == "serie" || $slow == "series"|| $slow == "006") return "series";
    if($slow == "servizio" || $slow == "service" || $slow == "services" || $slow == "014") return "service";
    return $text;
}

function translateKey($text,$resize = false, $debug = false){

    $text = strtolower(trim($text));
    if($debug) var_dump("step 1 = > ".$text);
    $text = exceptionTextTranslate($text);
    if($debug) var_dump("step 2 = > ".$text);
    $lang = JFactory::getLanguage();
    $lang_code = substr($lang->getTag(), 0,2);


    if($debug) var_dump("step 3 = > ".$text);

    $textNew = get_text($text);
    if($textNew != $text && !empty($textNew)) return $textNew;

    $arrayTranslate = array(
        "it"=> array(


            "TIPOLOGIA"=>"TIPO DATO",
            "CATEGORIA"=>"CATEGORIA ISO",
            "INSPIRE"=>"TEMA INSPIRE",
            "SERVIZIO"=>"TIPO SERVIZIO",

            // Stato
            "approvato"=>"Approvato",
            "cancellato"=>"Cancellato",
            "da cancellare"=>"Da cancellare",
            "bozza"=>"Bozza",
            "inviato"=>"Inviato",

            "approved"=>"Approvato",
            "disapproved"=>"Cancellato",
            "incomplete"=>"Da cancellare",
            "draft"=>"Bozza",
            "canceled"=>"Cancellato",
            "posted"=>"Inviato",

            // Metodo di pubblicazione
            "caricato"=>"Caricato",
            "editato"=>"Editato",
            "raccolto"=>"Raccolto",
            "registrato"=>"Registrato",

            "upload"=>"Caricato",
            "editor"=>"Editato",
            "harvester"=>"Raccolto",
            "registration"=>"Registrato",
            "registry"=>"Registrato",

            //tipo dato
            "Servizio"=>"Servizio",
            "Dataset"=>"Dataset",
            "Serie"=>"Serie",
            "Nuove acquisizioni"=>"Nuove acquisizioni",

            "service"=>"Servizio",
            "dataset"=>"Dataset",
            "series"=>"Serie",
            "model"=>"Nuove acquisizioni",

            //Tipo servizio
            "Ricerca"=>"Ricerca",
            "Scaricamento"=>"Scaricamento",
            "Chiamata"=>"Chiamata",
            "Altro"=>"Altro",
            "Trasformazione"=>"Trasformazione",
            "Visualizzazione"=>"Visualizzazione",

            "discovery"=>"Ricerca",
            "download"=>"Scaricamento",
            "invoke"=>"Chiamata",
            "other"=>"Altro",
            "transformation"=>"Trasformazione",
            "view"=>"Visualizzazione",

            //Categorie ISO nuove
            "Acque interne"=>"Acque interne",
            "Acque marine - Oceani"=>"Acque marine - Oceani",
            "Agricoltura"=>"Agricoltura",
            "Ambiente"=>"Ambiente",
            "Biota"=>"Biota",
            "Climatologia - Metereologia - Atmosfera"=>"Climatologia - Metereologia - Atmosfera",
            "Confini"=>"Confini",
            "Economia"=>"Economia",
            "Elevazione"=>"Elevazione",
            "Informazioni geoscientifiche"=>"Informazioni geoscientifiche",
            "Intelligence - Settore militare"=>"Intelligence - Settore militare",
            "Localizzazione"=>"Localizzazione",
            "Mappe di base - Immagini - Copertura terrestre"=>"Mappe di base - Immagini - Copertura terrestre",
            "Pianificazione - Catasto"=>"Pianificazione - Catasto",
            "Salute"=>"Salute",
            "Servizi di pubblica utilità - Comunicazione"=>"Servizi di pubblica utilità - Comunicazione",
            "Società"=>"Società",
            "Strutture"=>"Strutture",
            "Trasporti"=>"Trasporti",

            "inland Waters"=>"Acque interne",
            "inlandWaters"=>"Acque interne",
            "oceans"=>"Acque marine - Oceani",
            "farming"=>"Agricoltura",
            "environment"=>"Ambiente",
            "biota"=>"Biota",
            "climatology meteorology atmosphere"=>"Climatologia - Metereologia - Atmosfera",
            "climatologyMeteorologyAtmosphere"=>"Climatologia - Metereologia - Atmosfera",
            "boundaries"=>"Confini",
            "economy"=>"Economia",
            "elevation"=>"Elevazione",
            "geoscientific information"=>"Informazioni geoscientifiche",
            "geoscientificInformation"=>"Informazioni geoscientifiche",
            "intelligence military"=>"Intelligence - Settore militare",
            "intelligenceMilitary"=>"Intelligence - Settore militare",
            "location"=>"Localizzazione",
            "imagery BaseMaps EarthCover"=>"Mappe di base - Immagini - Copertura terrestre",
            "imageryBaseMapsEarthCover"=>"Mappe di base - Immagini - Copertura terrestre",
            "planning - cadastre"=>"Pianificazione - Catasto",
            "planningCadastre"=>"Pianificazione - Catasto",
            "health"=>"Salute",
            "utilities communication"=>"Servizi di pubblica utilità - Comunicazione",
            "utilitiesCommunication"=>"Servizi di pubblica utilità - Comunicazione",
            "society"=>"Società",
            "structure"=>"Strutture",
            "transportation"=>"Trasporti",

            //Categorie ISO
            "Administrative units"=>"Unità amministrative",
            "Agricultural and aquaculture facilities"=>"Impianti agricoli e acquacoltura",
            "Area management/restriction/regulation zones and reporting units"=>"Zone di gestione / aree di restrizione / regolazione e unità di reporting",
            "population distribution ? demography"=>"Distribuzione della popolazione - demografia",
            "Atmospheric conditions"=>"Condizioni atmosferiche",
            "Land cover"=>"Copertura del suolo",
            "Habitats and biotopes"=>"Habitat e biotopi",
            "Human health and safety"=>"Salute umana e sicurezza",
            "Land use"=>"Utilizzo del territorio",
            "Bio-geographical regions"=>"Regioni biogeografiche",
            "Meteorological geographical features"=>"Sistemi di griglie geografiche",
            "Geology"=>"Geologia",

            // TEMI INSPIRE

            "Atmosphericconditions"=>"Condizioni atmosferiche",
            "Landcover"=>"Copertura del suolo",
            "Populationdistribution-demography"=>"Distribuzione della popolazione-demografia",
            "Speciesdistribution"=>"Distribuzione delle specie",
            "Buildings"=>"Edifici",
            "Meteorologicalgeographicalfeatures"=>"Elementi geografici meteorologici",
            "Oceanographicgeographicalfeatures"=>"Elementi geografici oceanografici",
            "Elevation"=>"Elevazione",
            "Habitatsandbiotopes"=>"Habitatebiotopi",
            "Hydrography"=>"Idrografia",
            "Agriculturalandaquaculturefacilities"=>"Impianti agricolie di acqua coltura",
            "Environmentalmonitoringfacilities"=>"Impianti di monitoraggio ambientale",
            "Addresses"=>"Indirizzi",
            "Geographicalnames"=>"Nomigeografici",
            "Orthoimagery"=>"Ortoimmagini",
            "Cadastralparcels"=>"Parcellecatastali",
            "Productionandindustrialfacilities"=>"Produzione e impianti industriali",
            "Bio-geographicalregions"=>"Regioni biogeografiche",
            "Searegions"=>"Regionimarine",
            "Transportnetworks"=>"Reti di trasporto",
            "Energyresources"=>"Risorse energetiche",
            "Mineralresources"=>"Risorse minerarie",
            "Humanhealthandsafety"=>"Salute umana e sicurezza",
            "Utilityandgovernmentalservices"=>"Servizi di pubblica utilità e servizi amministrativi",
            "Coordinatereferencesystems"=>"Sistemi di coordinate",
            "Geographicalgridsystems"=>"Sistemi di griglie geografiche",
            "Protectedsites"=>"Siti protetti",
            "Soil"=>"Suolo",
            "Administrativeunits"=>"Unità amministrative",
            "Statisticalunits"=>"Unità statistiche",
            "Landuse"=>"Utilizzo del territorio",
            "Naturalriskzones"=>"Zone a rischio naturale",
            "Areamanagement/restriction/regulationzonesandreportingunits"=>"Zonesottoposteagestione/limitazioni/regolamentazioneeunitàconobbligodicomunicaredati",

            "Condizioni atmosferiche"                               => "Condizioni atmosferiche",
            "Copertura del suolo"                                   => "Copertura del suolo",
            "Distribuzione della popolazione - demografia"          => "Distribuzione della popolazione - demografia",
            "Distribuzione delle specie"                            => "Distribuzione delle specie",
            "Edifici"                                               => "Edifici",
            "Elementi geografici meteorologici"                     => "Elementi geografici meteorologici",
            "Elementi geografici oceanografici"                     => "Elementi geografici oceanografici",
            "Geologia"                                              => "Geologia",
            "Habitat e biotopi"                                     => "Habitat e biotopi",
            "Idrografia"                                            => "Idrografia",
            "Impianti agricoli e di acquacoltura"                   => "Impianti agricoli e di acquacoltura",
            "Impianti di monitoraggio ambientale"                   => "Impianti di monitoraggio ambientale",
            "Indirizzi"                                             => "Indirizzi",
            "Nomi geografici"                                       => "Nomi geografici",
            "Orto immagini"                                         => "Orto immagini",
            "Parcelle catastali"                                    => "Parcelle catastali",
            "Produzione e impianti industriali"                     => "Produzione e impianti industriali",
            "Regioni biogeografiche"                                => "Regioni biogeografiche",
            "Regioni marine"                                        => "Regioni marine",
            "Reti di trasporto"                                     => "Reti di trasporto",
            "Risorse energetiche"                                   => "Risorse energetiche",
            "Risorse minerarie"                                     => "Risorse minerarie",
            "Salute umana e sicurezza"                              => "Salute umana e sicurezza",
            "Servizi di pubblica utilità e servizi amministrativi"  => "Servizi di pubblica utilità e servizi amministrativi",
            "Sistemi di coordinate"                                 => "Sistemi di coordinate",
            "Sistemi di griglie geografiche"                        => "Sistemi di griglie geografiche",
            "Siti protetti"                                         => "Siti protetti",
            "Suolo"                                                 => "Suolo",
            "Unità amministrative"                                  => "Unità amministrative",
            "Unità statistiche"                                     => "Unità statistiche",
            "Utilizzo del territorio"                               => "Utilizzo del territorio",
            "Zone a rischio naturale"                               => "Zone a rischio naturale",
            "Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati" => "Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati",


            // FIX: errata data entry
            "Distribuzione della popolazione _ demografia" => "Distribuzione della popolazione - demografia",
            "Distribuzione della popolazione ? demografia" => "Distribuzione della popolazione - demografia",
        ),
        "en"=> array(


            "TIPOLOGIA"=>"Type",
            "CATEGORIA"=>"ISO Category",
            "INSPIRE"=>"INSPIRE Theme",
            "SERVIZIO"=>"Service",

            // Stato
            "approvato"=>"Approved",
            "cancellato"=>"Cancellato",
            "da cancellare"=>"Incomplete",
            "bozza"=>"Draft",
            "inviato"=>"Posted",

            "approved"=>"Approved",
            "disapproved"=>"Cancellato",
            "incomplete"=>"Incomplete",
            "draft"=>"Draft",
            "posted"=>"Posted",

            // Metodo di pubblicazione
            "caricato"=>"Upload",
            "editato"=>"Update",
            "raccolto"=>"Harvester",
            "registrato"=>"Registry",

            "upload"=>"Upload",
            "editor"=>"Update",
            "harvester"=>"Harvester",
            "registration"=>"Registry",
            "registry"=>"Registry",


            //tipo dato
            "Servizio"=>"Service",
            "Dataset"=>"Dataset",
            "Serie"=>"Series",
            "Nuove acquisizioni"=>"New acquisitions",
            "model"=>"New acquisitions",

            "service"=>"Service",
            "dataset"=>"Dataset",
            "series"=>"Series",

            //Tipo servizio
            "Ricerca"=>"Discovery",
            "Scaricamento"=>"Download",
            "Chiamata"=>"Other",
            "Altro"=>"Altro",
            "Trasformazione"=>"Transformation",
            "Visualizzazione"=>"View",

            "discovery"=>"Discovery",
            "download"=>"Download",
            "invoke"=>"Invoke",
            "other"=>"Other",
            "transformation"=>"Transformation",
            "view"=>"View",

            //Categorie ISO nuove



            "inland waters"=>"Inland Waters",
            "inlandWaters"=>"Inland Waters",
            "oceans"=>"Oceans",
            "farming"=>"Farming",
            "environment"=>"Environment",
            "biota"=>"Biota",
            "climatology meteorology atmosphere"=>"Climatology Meteorology Atmosphere",
            "climatologyMeteorologyAtmosphere"=>"Climatology Meteorology Atmosphere",
            "boundaries"=>"Boundaries",
            "economy"=>"Economy",
            "elevation"=>"Elevation",
            "geoscientific information"=>"Geoscientific Information",
            "geoscientificInformation"=>"Geoscientific Information",
            "intelligence military"=>"Intelligence Military",
            "intelligenceMilitary"=>"Intelligence Military",
            "location"=>"Location",
            "imagery BaseMaps EarthCover"=>"Imagery BaseMaps EarthCover",
            "imageryBaseMapsEarthCover"=>"Imagery BaseMaps EarthCover",
            "planning - cadastre"=>"Planning - Cadastre",
            "planningCadastre"=>"Planning - Cadastre",
            "health"=>"Health",
            "utilities communication"=>"Utilities Communication",
            "utilitiesCommunication"=>"Utilities Communication",
            "society"=>"Society",
            "structure"=>"Structure",
            "transportation"=>"Transportation",
            "climatology - Meteorology - Atmosphere"=>"Climatology - Meteorology - Atmosphere",


            //Categorie ISO
            "Administrative units"=>"Administrative units",
            "Agricultural and aquaculture facilities"=>"Agricultural and aquaculture facilities",
            "Area management/restriction/regulation zones and reporting units"=>"Area management/restriction/regulation zones and reporting units",
            "population distribution ? demography"=>"Population distribution - demography",
            "Atmospheric conditions"=>"Atmospheric conditions",
            "Land cover"=>"Land cover",
            "Habitats and biotopes"=>"Habitats and biotopes",
            "Human health and safety"=>"Human health and safety",
            "Land use"=>"Land use",
            "Bio-geographical regions"=>"Bio-geographical regions",
            "Meteorological geographical features"=>"Meteorological geographical features",
            "Geology"=>"Geology",

            // TEMI INSPIRE

            "Atmosphericconditions"=>"Atmospheri cconditions",
            "Landcover"=>"Land cover",
            "Populationdistribution-demography"=>"Population distribution - demography",
            "species distribution"=>"Species distribution",
            "Speciesdistribution"=>"Species distribution",
            "Buildings"=>"Buildings",
            "Meteorologicalgeographicalfeatures"=>"Meteorological geographical features",
            "oceanographic geographical features"=>"Oceanographic geographical features",
            "Oceanographicgeographicalfeatures"=>"Oceanographic geographical features",
            "Elevation"=>"Elevation",
            "Habitatsandbiotopes"=>"Habitats and biotopes",
            "Hydrography"=>"Hydrography",
            "Agriculturalandaquaculturefacilities"=>"Agricultural and aqua culture facilities",
            "Environmentalmonitoringfacilities"=>"Environment al monitoring facilities",
            "Addresses"=>"Addresses",
            "Geographicalnames"=>"Geographicalnames",
            "Orthoimagery"=>"Orthoimagery",
            "Cadastralparcels"=>"Cadastralparcels",
            "Productionandindustrialfacilities"=>"Production and industrial facilities",
            "production and industrial facilities"=>"Production and industrial facilities",
            "Bio-geographicalregions"=>"Bio - geographical regions",
            "Searegions"=>"Searegions",
            "Transportnetworks"=>"Transportnetworks",
            "Energyresources"=>"Energyresources",
            "Mineralresources"=>"Mineralresources",
            "Humanhealthandsafety"=>"Humanhealthandsafety",
            "Utilityandgovernmentalservices"=>"Utility and governmental services",
            "Coordinatereferencesystems"=>"Coordinate reference systems",
            "Geographicalgridsystems"=>"Geographical grid systems",
            "protected sites"=>"Protected sites",
            "Protectedsites"=>"Protected sites",
            "Soil"=>"Soil",
            "Administrativeunits"=>"Administrative units",
            "statistical units"=>"Statistical units",
            "Statisticalunits"=>"Statistical units",
            "Landuse"=>"Landuse",
            "Naturalriskzones"=>"Natural risk zones",
            "Areamanagement/restriction/regulationzonesandreportingunits"=>"Areamanagement / restriction / regulation zones and reporting units",


            "Condizioni atmosferiche"                               => "Atmospheric conditions",
            "Copertura del suolo"                                   => "Land cover",
            "population distribution - demography"          => "Population distribution - demography",
            "Distribuzione della popolazione - demografia"          => "Population distribution - demography",
            "Distribuzione delle specie"                            => "Species distribution",
            "Edifici"                                               => "Buildings",
            "Elementi geografici meteorologici"                     => "Meteorological geographical features",
            "Elementi geografici oceanografici"                     => "Oceanographic geographical features",
            "Geologia"                                              => "Geology",
            "Habitat e biotopi"                                     => "Habitats and biotopes",
            "Idrografia"                                            => "Hydrography",
            "Impianti agricoli e di acquacoltura"                   => "Agricultural and aquaculture facilities",
            "environmental monitoring facilities"                   => "Environmental monitoring facilities",
            "Impianti di monitoraggio ambientale"                   => "Environmental monitoring facilities",
            "Indirizzi"                                             => "Addresses",
            "geographical names"                                       => "Geographical names",
            "Nomi geografici"                                       => "Geographical names",
            "Orto immagini"                                         => "Orthoimagery",
            "cadastral parcels"                                    => "Cadastral parcels",
            "Parcelle catastali"                                    => "Cadastral parcels",
            "Produzione e impianti industriali"                     => "Production and industrial facilities",
            "Regioni biogeografiche"                                => "Bio-geographical regions",
            "sea regions"                                        => "Sea regions",
            "Regioni marine"                                        => "Sea regions",
            "transport networks"                                     => "Transport networks",
            "Reti di trasporto"                                     => "Transport networks",
            "energy resources"                                   => "Energy resources",
            "Risorse energetiche"                                   => "Energy resources",
            "mineral resources"                                     => "Mineral resources",
            "Risorse minerarie"                                     => "Mineral resources",
            "Salute umana e sicurezza"                              => "Human health and safety",
            "utility and governmental services"  => "Utility and governmental services",
            "Servizi di pubblica utilità e servizi amministrativi"  => "Utility and governmental services",
            "coordinate reference systems"                                 => "Coordinate reference systems",
            "Sistemi di coordinate"                                 => "Coordinate reference systems",
            "geographical grid systems"                        => "Geographical grid systems",
            "Sistemi di griglie geografiche"                        => "Geographical grid systems",
            "Siti protetti"                                         => "Protected sites",
            "Suolo"                                                 => "Soil",
            "Unità amministrative"                                  => "Administrative units",
            "Unità statistiche"                                     => "Statistical units",
            "Utilizzo del territorio"                               => "Land use",
            "natural risk zones"                               => "Natural risk zones",
            "Zone a rischio naturale"                               => "Natural risk zones",
            "Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati" => "Area management/restriction/regulation zones and reporting units",


            // FIX: errata data entry
            "Distribuzione della popolazione _ demografia" => "Population distribution - demography",
            "Distribuzione della popolazione ? demografia" => "Population distribution - demography",





        )
    );

    foreach ($arrayTranslate[$lang_code] as $key => $value){

        if($debug) echo $key . " => " . $value . "<br>";

        if($text == strtolower($key)){
            if($debug) echo " => " . $value . "<br>";
            return trim($value);
        }
    }



    if($debug) var_dump("step 4 = > ".$text);

    //if($resize) $text = substr($text,0,3)."...";

    //var_dump("non trovato ".$text);
    return null;

}

function addRagrCount($array_chart_user){
    $totalRag = array();
    foreach ($array_chart_user as $user){
        foreach ($user as $item){
            if(!$totalRag[$item['name']]) $totalRag[$item['name']] = 0;
            $totalRag[$item['name']] += $item['value'];
        }
    }
    return $totalRag;
}

function replaceNameUser($username){
    return str_replace(' ', '',strtolower ($username));
}

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
    $json = preg_replace('/,\s*([\]}])/m', '$1', utf8_encode($html));
    $json = json_decode($json,true);
    if (strpos($url, 'harvester/list') !== false && $debug && false) {//per vedere contenuto riposta
        $html = file_get_contents($url);
        var_dump($html);
    }
    return $json;
}

function getGroupId($groupName,$idGroup){
    $db = JFactory::getDbo();
    $select = "select id from #__usergroups where title='".$groupName."'";
    $db->setQuery($select);
    $db->query();
    $data = $db->loadObject();

    $groupId = $data->id;

    echo $groupId;
    if(empty($groupId))
        $groupId = $idGroup;

    return $groupId == $idGroup;
}

function removeNotFound($array){
    $arraySup = array();

    $lang = JFactory::getLanguage();
    $lang_code = substr($lang->getTag(), 0,2);

    foreach ($array as $elem){

        if(trim($elem) != translateKey(trim($elem))){
            array_push($arraySup, trim(translateKey(trim($elem))));
        }else if($lang_code == "en"){
            array_push($arraySup, trim(translateKey(trim($elem))));
        }

    }

    return $arraySup;
}


function customTraslate($item){

    $raggruppamenti = explode(",",$item['raggruppamenti']);//removeNotFound(explode(",",$item['raggruppamenti']));


    //raggruppamenti
    $supRag = array();
    foreach ($raggruppamenti as $elem){
        $trad = translateKey(trim($elem));
        if(!empty($trad) && !in_array($trad,$supRag)){
            array_push($supRag,$trad);
        }
    }



    for($i = 0; $i< count($item['dettaglio']); $i++){

        $arraySup = array();
        $arraySupConteggio = array();
        foreach ($item['dettaglio'][$i]['conteggio'] as $elem){

            $key = translateKey($elem['raggruppamento']);

            if(!$arraySupConteggio[$key]) $arraySupConteggio[$key]= 0;
            $arraySupConteggio[$key] += $elem['conteggio'];
        }

        foreach($arraySupConteggio as $key => $value){
            array_push($arraySup,
                array(
                    "raggruppamento" => $key,
                    "conteggio" => $value,
                )
            );
        }

        $item['dettaglio'][$i]['conteggio'] = $arraySup;
    }

    $item['raggruppamenti'] = implode(", ",array_unique($supRag));
    return $item;
}

function compareByName($a, $b) {
    return strcmp($a["nomePA"], $b["nomePA"]);
}

require_once JPATH_BASE . '/includes/functions.php';

$juser = JFactory::getUser();


//$controllo_disabled_select = !getGroupId("super administrator",$juser->get("groups")[0]);
$controllo_disabled_select = !$is_admin;	//definito in functions.php

if($controllo_disabled_select){//todo controllo ruolo
    /** ============ controllo PA =================*/
    $userPA = array(
        "id"    => $juser->id,//inserire il nome id //todo id ldap
        "name"  => $juser->username//inserire il nome utente
    );
}

$ownerValue = !empty($_POST['owner'])? $_POST['owner']:"";
$ownerValuePA = null;
if(!empty($userPA['name'])){
    $control_PA_value = true;
    $url = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/getPAFromUser?User=".$userPA['name'];
    $arrayownerPA = getByURL($url);

    //result pa
    $ownerValuePA = $arrayownerPA[0]['id'];
    $ownerValuePASave = $arrayownerPA[0]['id'];
    $ownerValue = $userPA['id'];
}


/** ============ get all PA =================*/
$url = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/getAllPA";
$arrayPA = getByURL($url);




usort($arrayPA, 'compareByName');

/** ============ get all type =================*/
$url = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/getAllType";
$arrayTYPE = getByURL($url);


if($_POST){
    $criterio_tipo_stat = $_POST['tipo_stat'];
    $date = explode(" - ",$_POST['daterange']);

    if(!empty($_POST['option_send1'])) $_POST['option_send'] = $_POST['option_send1'];
    $typeSend = $_POST['option_send'] == "PA" ? "dati_pa" : "dati_type";

    if($typeSend == "dati_pa"){
        $_POST['dati_pa'] = $_POST['dati_pa']?$_POST['dati_pa']:$_POST['dati_pa_1'];
        $ownerValuePA = $_POST['dati_pa'];
    }

    if($typeSend == "dati_type"){
        $ownerValueTYPE = $_POST['dati_type'];
    }

    $array = array(
        "tipo_stat" =>  $_POST['tipo_stat'],
        $typeSend   =>  urlencode($_POST[$typeSend]),
        //"owner"     =>  $_POST['owner']?$_POST['owner']:$_POST['owner_1'], todo per ora no
        "start-date"=>  date("Y-m-d",strtotime(str_replace('/','-',$date[0]))),
        "end-date"  =>  date("Y-m-d",strtotime(str_replace('/','-',$date[1])))
        //"dati_rag"  =>  $_POST['dati_rag']);
    );

    $urlParameter = "?";
    foreach ($array as $key=>$value) {
        if (!empty($value)) {
            if ($urlParameter != "?") $urlParameter .= "&";
            $urlParameter .= $key . "=" . $value;
        }
    }

    $url = GPT_BASE_URL_SERVER."/rest/usage/harvester/list".$urlParameter;

    $json = getByURL($url);

    $array = $json['harvester']['elencoStat'];
    $controlVuoto = !($json['harvester']['elencoStat'][0]['tipoStat'] &&
        $json['harvester']['elencoStat'][0]['raggruppamenti'] &&
        count($json['harvester']['elencoStat'][0]['dettaglio']));

    $array_chart = array();
    $array_chart_user = array();
    $criteriComplete = array();
    $csvExport = "";

    if(count($array) != 0){

        foreach ($array as $item){
            $translateItem = customTraslate($item);
            $criteriComplete[$translateItem['tipoStat']] = $translateItem;
            $criterio = $translateItem;
        }
    }

    $raggruppamenti = array_map('trim', explode(",",$criterio['raggruppamenti']));

    sort($raggruppamenti,SORT_FLAG_CASE);

}

?>

<div class="container paddingCustom bottom50">
    <div class="row">
        <div class="col-md-12">
            <h2 class="subtitle_custom"><?= JHtml::_('content.prepare', '{loadmodule breadcrumbs}') ?></h2>
            <h1 class="title_custom"><?= $this->escape($this->item->title) ?></h1>

            <div class="container-fluid">
                <form class="row form-inline" method="POST">
                    <fieldset>
                        <legend class="sr-only" id="optionSend"></legend>
                        <div role="radiogroup" aria-labelledby="optionSend">
                            <div class="form-group col-md-6 customLabel">
                                <label class="sr-only" for="option_send_adm"><?= JText::_('ADMIN') ?></label>
                                <input type="radio" id="option_send_adm" tabindex="1" name="option_send" title="<?= JText::_('ADMIN') ?>" <?php if(!empty($_POST['option_send']) && $_POST['option_send'] == "PA" || empty($_POST['option_send'])):?>checked<?php endif;?> value="PA"> <label for="listPA"><?= JText::_('SELECT_ADMIN') ?></label>
                                <div id="disablePA" class="disabledCustom"></div>
                                <select id="listPA" onchange="eventChange()" <?php if(!(!empty($_POST['option_send']) && $_POST['option_send'] == "PA" ) && !empty($_POST['option_send'])):?>disabled<?php endif;?> <?php if(!empty($control_PA_value) && false):?>disabled<?php endif;?> class="form-control form-controlCustom" name="dati_pa">
                                    <option value="s" <?php if("s"==$ownerValuePA):?>selected<?php endif;?>><?= JText::_('SUMMARY') ?></option>
                                    <option value="*" <?php if("*"==$ownerValuePA):?>selected<?php endif;?>><?= JText::_('DETAIL') ?></option>

                                    <?php foreach ($arrayPA as $itemPA):?>
                                        <option value="<?php echo $itemPA['id'];?>" <?php if($itemPA['id']==$ownerValuePA):?>selected<?php endif;?>><?php echo utf8_decode($itemPA['nomePA']);?></option>
                                    <?php endforeach;?>
                                </select>
                                <?php if(!empty($control_PA_value)):?>
                                    <input type="hidden" name="dati_pa_1" value="<?php echo $ownerValuePA;?>">
                                <?php endif;?>
                            </div>
                            <div class="form-group col-md-6 customLabel">
                                <label class="sr-only" for="option_send_org"><?= JText::_('ORGANIZATION') ?></label>
                                <input type="radio" tabindex="2" id="option_send_org" name="option_send1" value="TYPE" title="<?= JText::_('ORGANIZATION') ?>" <?php if(!empty($_POST['option_send']) && $_POST['option_send'] == "TYPE"):?>checked<?php endif;?>> <label for="listTYPE"><?= JText::_('ORGANIZATION_TYPE') ?></label>
                                <div id="disableTYPE" class="disabledCustom"></div>
                                <select id="listTYPE" onchange="eventChange()" <?php if(!(!empty($_POST['option_send']) && $_POST['option_send'] == "TYPE") || empty($_POST['option_send'])):?>disabled<?php endif;?> class="form-control form-controlCustom" name="dati_type">
                                    <option value="s" <?php if(!empty($ownerValueTYPE) && "s"==$ownerValueTYPE):?>selected<?php endif;?>><?= JText::_('SUMMARY') ?></option>
                                    <option value="*" <?php if(!empty($ownerValueTYPE) && "*"==$ownerValueTYPE):?>selected<?php endif;?>><?= JText::_('DETAIL') ?></option>
                                    <?php foreach ($arrayTYPE as $item):?>
                                        <option value="<?php echo !empty($item['id']) ? $item['id'] : "";?>" <?php if(!empty($ownerValueTYPE) && !empty($item['id']) && $item['id']==$ownerValueTYPE):?>selected<?php endif;?>><?php echo !empty($item['nome']) ? $item['nome'] : "";?></option>
                                    <?php endforeach;?>
                                </select>
                                <?php if(!empty($control_PA_value)):?>
                                    <input type="hidden" name="dati_pa_1" value="<?php echo $ownerValuePA;?>">
                                <?php endif;?>
                            </div>
                        </div>
                    </fieldset>
                    <div class="form-group col-md-6 customLabel">
                        <label for="daterange"><?= JText::_('SELECT_DATE') ?></label>
                        <input class="form-control form-controlCustom" type="text" id="daterange" name="daterange" value="<?php echo !empty($_POST['daterange']) ? $_POST['daterange'] : "";?>" />
                    </div>
                    <div class="form-group col-md-6 customLabel">
                        <label for="tipo_stat"><?= JText::_('SEARCH_BY') ?></label>
                        <select class="form-control form-controlCustom customSelectPAStatus" id="tipo_stat" name="tipo_stat" >
                            <?php if(!empty($juser->username)):?>
                                <option value="STATO" <?php if(!empty($criterio_tipo_stat) && $criterio_tipo_stat=="STATO"):?>selected<?php endif;?>><?= JText::_('STATS_STATE') ?></option>
                                <option value="METODO" <?php if(!empty($criterio_tipo_stat) && $criterio_tipo_stat=="METODO"):?>selected<?php endif;?>><?= JText::_('STATS_METHOD') ?></option>
                            <?php endif;?>
                            <option value="TIPOLOGIA" <?php if(!empty($criterio_tipo_stat) && $criterio_tipo_stat=="TIPOLOGIA"):?>selected<?php endif;?>><?= JText::_('STATS_TYPE') ?></option>
                            <option value="CATEGORIA" <?php if(!empty($criterio_tipo_stat) && $criterio_tipo_stat=="CATEGORIA"):?>selected<?php endif;?>><?= JText::_('STATS_CATEGORY') ?></option>
                            <option value="INSPIRE" <?php if(!empty($criterio_tipo_stat) && $criterio_tipo_stat=="INSPIRE"):?> selected<?php endif;?>><?= JText::_('STATS_INSPIRE') ?></option>
                            <option value="SERVIZIO" <?php if(!empty($criterio_tipo_stat) && $criterio_tipo_stat=="SERVIZIO"):?>selected<?php endif;?>><?= JText::_('STATS_SERVICE') ?></option>

                        </select>
                    </div>
                    <div class="form-group col-md-8 customLabel top20"  style="display: none">
                        <label for="listOwner"><?= JText::_('STATS_SELECT_USER') ?></label>
                        <select id="listOwner" class="form-control form-controlCustom" name="owner" <?php if(!empty($control_PA_value)):?>disabled<?php endif;?>>
                            <option value="*"><?= JText::_('STATS_ALL') ?></option>
                        </select>
                        <?php if(!empty($control_PA_value)):?>
                            <input type="hidden" name="owner_1" value="<?php echo $ownerValue;?>">
                        <?php endif;?>
                    </div>
                    <div class="form-group col-md-4 customLabel top20 checkboxCustom" style="display: none">
                        <label for="dati_rag"><?= JText::_('STATS_GROUPED_DATA') ?></label>
                        <input id="dati_rag" name="dati_rag" checked <?php if(!empty($_POST['dati_rag'])):?>checked<?php endif;?> type="checkbox">
                    </div>
                    <div class="col-md-8 top20">
                        <button type="submit" class="btn btn-default btn-custom"><?= JText::_('STATS_EXECUTE') ?></button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>




<?php if($_POST):?>
<div class="container-fluid detailStatBox paddingCustom" style="position: relative">
    <div id="loadingSelectTotal" style="top: 0;left: 0;position: absolute;background: #ddd; width: 100%;height: 100%;z-index:5;text-align: center;padding-top: 30px;">
        <div class="contentLoading">
            <i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
            <span class="sr-only">Loading...</span> <?= JText::_('LOADING') ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">

            <?php $date = explode(" - ",$_POST['daterange']);?>
            <div class="col-md-12 classTableUtente">
                <?php echo translateKey($_POST['tipo_stat']);?> - (<?php echo date("d/m/Y",strtotime(str_replace('/','-',$date[0])))." - ".date("d/m/Y",strtotime(str_replace('/','-',$date[1])));?>)
                <?php if(!(count($criteriComplete) == 0 || $controlVuoto)):?>
                    <span class="pull-right text-right">
							<button class="btnCustom bottom20" onclick="esportaCSV()"><?= JText::_('STATS_EXPORT') ?> <i class="fa fa-download" aria-hidden="true"></i></button>
						</span>
                <?php endif; ?>
            </div>

            <?php $countTotal = count($raggruppamenti);?>

            <?php if(count($criteriComplete) == 0 || $controlVuoto):?>
                <div class="col-md-12 noresultClassCustom"><?= JText::_('NO_RESULTS') ?></div>

            <?php else: ?>
                <table id="tableHistoryCustom" class="table-bordered">
                    <thead>
                    <tr>
                        <?php if($ownerValuePA != "s" && $ownerValueTYPE != "s"):?>
                            <th><?= JText::_('STATS_ORGANIZATION') ?></th><?php $csvExport .= JText::_('STATS_ORGANIZATION') . ";";?>
                            <?php if($_POST['option_send'] == "PA"):?>
                                <td><?= JText::_('ORGANIZATION_TYPE') ?></td><?php $csvExport .= JText::_('ORGANIZATION_TYPE') . ";";?>
                            <?php endif;?>
                        <?php endif;?>
                        <?php //$class = count($raggruppamenti) > 8 ? "verticalCustom":"orizontalCustom";?>
                        <?php //$class = count($raggruppamenti) > 8 ? "verticalCustom":"orizontalCustom";?>
                        <?php $controlNull = null;?>
                        <?php $controlNullN = 1?>



                        <?php foreach ($raggruppamenti as $item):?>
                            <?php if(trim($item) != "null" && trim($item) != ""):?>
                                <th class="<?php echo !empty($class) ? $class : "";?>" title="<?php echo !empty($item) ? translateKey(trim($item)) :"";?>"><?php echo !empty($raggruppamenti) && !empty($item) ? translateKey(trim($item),count($raggruppamenti) > 8) : "";?></th><?php if(!empty($item)) $csvExport .=translateKey(trim($item)).";";?>
                            <?php else:?>
                                <?php $controlNull = $controlNullN;?>
                            <?php endif;?>
                            <?php $controlNullN++; ?>
                        <?php endforeach;?>
                    </tr><?php $csvExport .="\\n";?>
                    </thead>

                    <tbody>

                    <?php $countTotalStat = 0;?>

                    <?php foreach ($criterio['dettaglio'] as $detail):?>


                        <?php $userEx = $detail['utente'];?>
                        <?php $user = $detail['utente'] == "*" ? JText::_('DETAIL') : $detail['utente'] == "s" ? JText::_('SUMMARY') : $detail['utente'];?>

                        <?php if (!count($criteriComplete) == 0 || !empty($user)):?>

                            <?php $countTotalStat++;?>
                            <?php $countInternal = 1;?>
                            <?php $total = 0;?>
                            <?php $array_chart_user[replaceNameUser($user)] = array();?>

                        <tr class="clickable-row"
                            data-user="<?php echo $user;?>"
                            data-graph="<?php echo replaceForKey(replaceNameUser($user))."_graph";?>">

                            <?php if($ownerValuePA != "s" && $ownerValueTYPE != "s"):?>
                                <td <?php if(empty($user)):?>class="noneElement"<?php endif;?>>
                                    <?php echo $user;?>
                                </td>
                                <?php $csvExport .=$user.";";?>

                                <?php if($_POST['option_send'] == "PA"):?>
                                    <td <?php if(empty($detail['tipoEnte'])):?>class="noneElement"<?php endif;?>>
                                        <?php echo $detail['tipoEnte'];?>
                                    </td>
                                    <?php $csvExport .=$detail['tipoEnte'].";";?>
                                <?php endif;?>
                            <?php endif;?>

                            <?php $controlNullN = 1;?>
                            <?php //TODO?>
                            <?php foreach ($raggruppamenti as $item2):?>
                                <?php if($controlNull == $controlNullN++){continue;}?>

                                <?php $controlTrovato = false;?>
                                <?php foreach ($detail['conteggio'] as $item):?>
                                    <?php if(translateKey(trim($item['raggruppamento'])) == trim($item2)):?>

                                        <?php $controlTrovato = true;?>

                                        <td data-attribute-name="<?php echo trim($item2);?>" <?php if(empty($item['conteggio'])):?>class="noneElement"<?php endif;?>>
                                            <?php echo $item['conteggio'];$csvExport .=trim($item['conteggio']).";";?>
                                            <?php array_push($array_chart_user[replaceNameUser($user)], array("name"  => trim($item2), "value" => trim($item['conteggio'])));?>
                                        </td>
                                    <?php endif;?>
                                <?php endforeach;?>

                                <?php if(!$controlTrovato):?>
                                    <?php array_push($array_chart_user[replaceNameUser($user)], array("name"  => trim($item2), "value" => 0));?>
                                    <?php $csvExport .="0;";?>
                                    <td class="noneElement"></td>
                                <?php endif;?>
                            <?php endforeach;?>

                            </tr><?php $csvExport .="\\n";?>

                        <?php endif;?>
                    <?php endforeach;?>


                    <?php if($countTotalStat > 1 && $userEx != "*" && $userEx != "s" && $ownerValuePA != "s" && $ownerValueTYPE != "s"):?>
                    <tfoot>
                    <tr>
                        <td><?= JText::_('STATS_TOTAL') ?></td><?php $csvExport .= JText::_('STATS_TOTAL').";";?>

                        <?php if($_POST['option_send'] == "PA"):?>
                            <td></td><?php $csvExport .=";";?>
                        <?php endif;?>
                        <?php $totalRag = addRagrCount($array_chart_user);?>
                        <?php foreach ($totalRag as $key => $value):?>
                            <td><?php echo $value;?></td><?php $csvExport .=$value.";";?>

                            <?php array_push($array_chart,array("name"=>$key,"value"=>$value));?>
                        <?php endforeach;?>
                    </tr><?php $csvExport .="\\n";?>
                    </tfoot>
                    <?php endif; ?>

                    </tbody>
                </table>
            <?php endif; ?>

        </div>
        <div class="col-md-4" <?php if (count($criteriComplete) == 0 || $controlVuoto):?>style="display: none;"<?php endif;?>>

            <div class="container-fluid">
                <div class="row">
                    <div id="filterChart" class="col-md-12 canvas_style" style="display: none;background: #F5F5F0!important;">
                        <div id="filterBox">
                            <div id="boxLabelFilter">
                                <?= JText::_('METADATA_FILTERS') ?>:
                            </div>
                            <ul id="filters-box-deatils"></ul>
                        </div>
                        <div>
                            <button id="result-success" class="btn bgreen"><?= JText::_('ADVSEARCH_SHOW_RESULTS') ?></button>
                        </div>
                    </div>

                    <div class="col-md-12 canvas_style">
                        <h3 class="title_chart">Pie Chart <span id="title_chart_1"><?= JText::_('STATS_TOTAL') ?></span></h3>
                        <canvas id="chart1" class="canvas_style_custom" width="250" height="250"></canvas>
                        <?php foreach ($array_chart_user as $key => $value):?>
                            <canvas id="<?php echo replaceForKey($key)."_graph_1";?>" class="canvas_style_custom" width="250" height="250" style="display: none;"></canvas>
                        <?php endforeach;?>
                        <canvas id="chart_filter_pie" width="250" height="250"></canvas>
                    </div>
                    <div class="col-md-12 top20 canvas_style">
                        <h3 class="title_chart"><?= JText::_('STATS_HISTOGRAM') ?> <span id="title_chart_2"><?= JText::_('STATS_TOTAL') ?></span></h3>
                        <canvas id="chart2" class="canvas_style_custom" width="250" height="250"></canvas>
                        <?php foreach ($array_chart_user as $key => $value):?>
                            <canvas id="<?php echo replaceForKey($key)."_graph_2";?>" class="canvas_style_custom" width="250" height="250"  style="display: none;"></canvas>
                        <?php endforeach;?>
                        <canvas id="chart_filter_bar" width="250" height="250" style="display: none;"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <script src="<?= $baseurls ?>js/chart.min.js"></script>

        <script>

            window.pathFolder = "<?php echo $baseurls;?>advancedSearch/";
            window.saveOtherPass = {};
            window.searchTextSup = [];
            window.otherPass =[];
            window.saveObjSearchText = {};
            window.gptUrl = "<?php echo GPT_REST_URL_SERVER;?>";
            window.typeFilter = "<?php echo $_POST['tipo_stat'];?>";

            jQuery("#result-success").click(function(){
                document.cookie = "saveObjSearchText=" + JSON.stringify(window.saveObjSearchText) + ";" + (24*60*60) + ";path=/";
                document.cookie = "saveCompositeStr=" + JSON.stringify(window.saveOtherPass) + ";" + (24*60*60) + ";path=/";
                document.cookie = "refer_url=stats;" + (24*60*60) + ";path=/";
                createObjUrl();
            });

            function generateDefineUrl(urlGeoportal,params) {

                var count = 1;
                for(var item in params){
                    urlGeoportal += count++ <= 1 ? "?" : "&";
                    urlGeoportal += item + "=" + params[item];
                }
                return urlGeoportal;
            }

            function createObjUrl() {

                var urlGeoportal = window.pathFolder + "/services-advancedSearch.php";


                var params = {
                    start: 1,
                    max: 15,
                    geometryType: "esriGeometryBox",
                };

                var cookie = generateDefineUrl("", params) + "&f=json";
                var paramsCrip = generateDefineUrl(window.gptUrl, params) + "&searchText=" + window.otherPass.join(" AND ") + "&"+ window.searchTextSup.join(" & ") + "&f=json";

                //if (debug) console.log(generateDefineUrl(window.gptUrl, params) + adapt + "&f=pjson");
                var proxy = true;

                if (proxy) {
                    var str = {
                        GPT_REST_URL_SERVER: encodeURIComponent(paramsCrip),
                        url: window.gptUrl
                    };
                    obj = {
                        type: "POST",
                        url: urlGeoportal,
                        data: str
                    };
                } else {
                    obj = {
                        type: "GET",
                        url: paramsCrip
                    };
                }

                //var jsonObj = JSON.stringify(obj);
                var d = new Date();
                d.setTime(d.getTime() + (1 * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                //document.cookie =  "datiRicerca=" + jsonObj + ";" + expires + ";path=/";
                document.cookie = "datiRicerca=" + cookie.substring(1) + ";" + expires + ";path=/";
                document.cookie = "datiRicercaUrl=" + paramsCrip + ";" + expires + ";path=/";

                window.location = "<?= JURI::root() . JText::_('URL_METADATA') ?>";

            }

            function escapeRegExp(str) {
                return str.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
            }

            function removePlus(str) {
                return str.replace(new RegExp(escapeRegExp('+'), 'g'), ' ');
            }

            function removePlus(str) {
                return str.replace(new RegExp(escapeRegExp('+'), 'g'), ' ');
            }

            function replaceAll(str, find, replace) {
                return str.replace(new RegExp(escapeRegExp(find), 'g'), replace);
            }

            function addFilter(title,text,complete,key,inText){

                if(isNaN(parseInt(text))){

                    jQuery(".canvas_style:nth-child(2)").addClass('top20');

                    var li = jQuery("<li/>",{
                        "data-title":title,
                        "title":complete,
                        text: title
                    });

                    if(inText){
                        window.saveObjSearchText[key] = complete;
                        window.otherPass.push(complete);
                    } else{
                        window.searchTextSup.push(complete);
                        window.saveOtherPass[key] = complete;
                    }

                    jQuery("#filters-box-deatils").append(li);

                    jQuery("#filterChart").show();
                }
            }

            function getCategory(txt){
                var array = {
                    "inlandWaters": "Acque interne",
                    "oceans": "Acque marine - Oceani",
                    "farming": "Agricoltura",
                    "environment": "Ambiente",
                    "biota": "Biota",
                    "climatologyMeteorologyAtmosphere": "Climatologia - Metereologia - Atmosfera",
                    "boundaries": "Confini",
                    "economy": "Economia",
                    "elevation": "Elevazione",
                    "geoscientificInformation": "Informazioni geoscientifiche",
                    "intelligenceMilitary": "Intelligence - Settore militare",
                    "location": "Localizzazione",
                    "imageryBaseMapsEarthCover": "Mappe di base - Immagini - Copertura terrestre",
                    "planningCadastre": "Pianificazione - Catasto",
                    "health": "Salute",
                    "utilitiesCommunication": "Servizi di pubblica utilità - Comunicazione",
                    "society": "Società",
                    "structure": "Strutture",
                    "transportation": "Trasporti"
                };

                for(var x in array){
                    if(array[x] == txt){
                        return x;
                    }
                }
            }

            function addFilterResponsabile(){
                jQuery("#filters-box-deatils").html('');
                var text = jQuery(".active td")[0].innerText;

                //window.paramsAdmin = replaceAll(text," ","+");
                addFilter("Responsabile",text,"apiso.DataOrganizationName:\""+text+"\"","admin_resp",true);
            }

            function addFilterFound(label,value){
                var type = window.typeFilter;

                switch(type){//apiso.Type:(dataset OR series) //selection-search
                    case "STATO":
                    case "METODO":break;
                    case "TIPOLOGIA":

                        if(label == "Dataset") label = "dataset";
                        if(label == "Serie" || label == "Series") label = "series";
                        if(label == "Servizio" || label == "Service") label = "service";
                        addFilter("Profilo",label,"apiso.Type:("+label+")","type",true);
                        break;
                    case "CATEGORIA":
                        addFilter("Profilo","Dataset","apiso.Type:(dataset)","type",true);
                        addFilter("Categoria ISO",label,"dataCategory="+getCategory(label)+"","category",false);
                        break;
                    case "INSPIRE":
                        addFilter("Profilo","Dataset","apiso.Type:(dataset)","type",true);
                        addFilter("Tema INSPIRE",label,'INSPIRETheme:("'+label+'")',"inspireThemes",true);
                    break;
                    case "SERVIZIO":
                        addFilter("Profilo","Servizio","apiso.Type:(service)","type",true);
                        addFilter("Tipo Servizio",label,"apiso.ServiceType:("+label+")","services",false);
                    break;
                }

            }

            function randomColor (){
                return '#'+Math.floor(Math.random()*16777215).toString(16);
            }

            function selectChartFilterType(label,value){
                jQuery("#tableHistoryCustom tr td:contains("+label+")").click();
            }

            function clickFilterChart(evt, activeElements){
                if(jQuery(".clickable-row.active").length != 0){
                    var element = jQuery(".clickable-row.active")[0];
                    var attr = element.getAttribute("data-user");
                    jQuery(".clickable-row.active")[0].click();
                    if(jQuery("#filters-box-deatils")[0].children.length == 3){
                        jQuery("[data-user='"+attr+"']")[0].click();
                    }
                }else{
                    jQuery("#chart_filter_pie").hide();
                    jQuery("#chart_filter_bar").hide();
                    jQuery("#filterChart").hide();
                    jQuery("#filters-box-deatils").html('');

                    jQuery(".canvas_style_custom").hide();
                    jQuery("#chart1").show();
                    jQuery("#chart2").show();
                }
                jQuery('#tableHistoryCustom tr td.active').removeClass("active");
            }

            function clickChart(that, evt, activeElements){
                var elementIndex = activeElements[0]._index;
                var value = that.data.datasets[0].data[elementIndex];
                var label = that.data.labels[elementIndex];
                var color = that.data.datasets[0].backgroundColor[elementIndex];
                var totalOther = that.data.datasets[0].data.reduce(function(total,num){
                    return parseInt(total)+parseInt(num);
                }) - parseInt(value);
                selectChartValue(label,value,totalOther,color);
            }

            function selectChartValue(label,value,total,color){

                <?php if(true)://(!empty($_POST['dati_pa']) && $_POST['dati_pa'] == "*") || (!empty($_POST['dati_type']) && $_POST['dati_type'] == "*")):?>
                //console.log(label+" -> "+value);

                //jQuery('#tableHistoryCustom tr').removeClass("active");
                var array = jQuery("#tableHistoryCustom th");
                for(var i=0;i< array.length;i++){
                    var txt = array[i].innerText.toUpperCase();
                    if(txt === label.toUpperCase()){
                        break;
                    }
                }

                var newLabels = [label];
                var newData = [parseInt(value)];
                var colors = [color];

                addFilterFound(label,value);
				
				var add = parseInt("<?php 
				
				$controlDettagli = !empty($_POST['dati_type']);
				
				
				
				$control1 = $_POST['dati_pa'] == "*" || (!empty($_POST['dati_pa']) && $_POST['dati_pa'] != "s");//details e singola scelta
				$controlSom = $_POST['dati_pa'] == "s";//sommario
			
				
				if($control1) echo 2;
				elseif(!$controlSom) echo 1;
				else echo 1;
				
		
				?>");
				jQuery('#tableHistoryCustom tr td:nth-child('+(i+add)+')').addClass('active');

                if(parseInt(total) != 0){
                    newLabels.push("Altro");
                    newData.push(parseInt(total));
                    colors.push("#ebebeb");
                }


                var data = {labels: newLabels, datasets: [{data: newData, borderWidth: 1, borderColor: colors, backgroundColor: colors, hoverBackgroundColor: colors}]};

                jQuery(".canvas_style_custom").hide();
                jQuery("#chart_filter_pie").show();
                jQuery("#chart_filter_bar").show();
                if(window.filterchart1) window.filterchart1.destroy();
                if(window.filterchart2) window.filterchart2.destroy();

                jQuery("#title_chart_1").text(jQuery("#title_chart_1").text()+" - "+ label);
                jQuery("#title_chart_2").text(jQuery("#title_chart_2").text()+" - "+label);
                window.filterchart1 = new Chart('chart_filter_pie',{type: 'doughnut', data: data, options: {
                        title: {
                            display: false,
                            text: 'Pie Chart Filter '+label
                        },
                        legend: {
                            display: false
                        },
                        onClick: function(evt, activeElements) {
                            clickFilterChart(evt,activeElements);
                        }
                    }});

                window.filterchart2 = new Chart('chart_filter_bar', {
                    type: 'bar',
                    data: data,
                    options:{
                        title: {
                            display: false,
                            text: 'Istogramma '+label
                        },
                        legend: {
                            display: false
                        },
                        scales:{
                            xAxes: [{
                                ticks: {
                                    autoSkip: false,
                                    //min: 1
                                    callback: function(value, index, values) {
                                        var vl = parseInt(data.datasets[0].data[index]);
                                        return vl > 0 /*&& vl > media*/? value : "";
                                    }
                                }
                            }]
                        },
                        onClick: function(evt, activeElements) {
                            clickFilterChart(evt,activeElements);
                        }
                    }
                });

                <?php endif;?>
            }
            //grafici

            <?php
            $labels = array();
            $data = array();
            $color = array();
            $colorBack = array();

            foreach($array_chart as $item):

                array_push($labels,$item['name']);
                array_push($data,$item['value']);
                array_push($color,sprintf('#%06X', mt_rand(0, 0xFFFFFF)));
            endforeach;;
            ?>


            var data = {labels: ["<?php echo implode('","',$labels);?>"], datasets: [{data: ["<?php echo implode('","',$data);?>"], borderWidth: 1, borderColor: ["<?php echo implode('","',$color);?>"], backgroundColor: ["<?php echo implode('","',$color);?>"], hoverBackgroundColor: ["<?php echo implode('","',$color);?>"]}]};
            var myPieChart = new Chart('chart1',{type: 'doughnut', data: data, options: {
                    title: {
                        display: false,
                        text: 'Pie Chart'
                    },
                    legend: {
                        display: false
                    },
                    hover: {
                        onHover: function(e) {
                            var point = this.getElementAtEvent(e);
                            if (point.length) e.target.style.cursor = 'pointer';
                            else e.target.style.cursor = 'default';
                        }
                    },
                    onClick: function(evt, activeElements) {
                        clickChart(this, evt, activeElements);
                    }
                }});

            var media = 0;
            for(var i = 0; i< data.datasets[0].data.length; i++){
                media += parseInt(data.datasets[0].data[i]);
            }

            media = parseInt(media / data.datasets[0].data.length);

            var myChart = new Chart('chart2', {
                type: 'bar',
                data: data,
                options:{
                    title: {
                        display: false,
                        text: 'Istogramma'
                    },
                    legend: {
                        display: false
                    },
                    hover: {
                        onHover: function(e) {
                            var point = this.getElementAtEvent(e);
                            if (point.length) e.target.style.cursor = 'pointer';
                            else e.target.style.cursor = 'default';
                        }
                    },
                    scales:{
                        xAxes: [{
                            ticks: {
                                autoSkip: false,
                                //min: 1
                                callback: function(value, index, values) {
                                    var vl = parseInt(data.datasets[0].data[index]);
                                    return vl > 0 /*&& vl > media*/? value : "";
                                }
                            }
                        }]
                    },

                    onClick: function(evt, activeElements) {
                        clickChart(this, evt, activeElements);
                    }

                }
            });

            <?php $countGraph = 0;

            foreach ($array_chart_user as $key => $value):
            $countGraph++;
            $labels = array();
            $data = array();

            foreach($value as $item):

                array_push($labels,translateKey($item['name']));
                array_push($data,!empty($item['value']) ? $item['value'] : 0);
                array_push($color,sprintf('#%06X', mt_rand(0, 0xFFFFFF)));

            endforeach;

            ?>
            var data_<?php echo $countGraph;?> = {labels: ["<?php echo implode('","',$labels);?>"], datasets: [{data: ["<?php echo implode('","',$data);?>"], borderWidth: 1, borderColor: ["<?php echo implode('","',$color);?>"], backgroundColor: ["<?php echo implode('","',$color);?>"], hoverBackgroundColor: ["<?php echo implode('","',$color);?>"]}]};
            var data<?php echo replaceForKey($key);?>_graph_1_data = {type: 'doughnut', data: data_<?php echo $countGraph;?>, options: {title: {display: false, text: 'Pie Chart'}, legend: {display: false},hover: {
                        onHover: function(e) {
                            var point = this.getElementAtEvent(e);
                            if (point.length) e.target.style.cursor = 'pointer';
                            else e.target.style.cursor = 'default';
                        }
                    },
                    onClick: function(evt, activeElements) {
                        clickChart(this, evt, activeElements);
                    }}};

            var media<?php echo $countGraph;?> = 0;
            for(var i = 0; i < data_<?php echo $countGraph;?>.datasets[0].data.length; i++){
                media<?php echo $countGraph;?> += parseInt(data_<?php echo $countGraph;?>.datasets[0].data[i]);
            }
            media<?php echo $countGraph;?> = parseInt(media<?php echo $countGraph;?> / data_<?php echo $countGraph;?>.datasets[0].data.length);

            var data<?php echo replaceForKey($key);?>_graph_2_data = {
                type: 'bar',
                data: data_<?php echo $countGraph;?>,
                options: {
                    title: {
                        display: false,
                        text: 'Istogramma'
                    },
                    legend: {
                        display: false
                    },
                    scales:{
                        xAxes: [{
                            ticks: {
                                autoSkip: false,
                                //min: 1
                                callback: function(value, index, values) {
                                    var vl = parseInt(data_<?php echo $countGraph;?>.datasets[0].data[index]);
                                    return vl > 0 ? value : "";
                                }
                            }
                        }],
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    },
                    hover: {
                        onHover: function(e) {
                            var point = this.getElementAtEvent(e);
                            if (point.length) e.target.style.cursor = 'pointer';
                            else e.target.style.cursor = 'default';
                        }
                    },
                    onClick: function(evt, activeElements) {
                        clickChart(this, evt, activeElements);
                    }
                }
            };


            <?php endforeach;?>


            jQuery('#tableHistoryCustom').on('click', '.clickable-row', function(event) {

                jQuery("#chart_filter_pie").hide();
                jQuery("#chart_filter_bar").hide();
                jQuery('#tableHistoryCustom tr td').removeClass("active");
                if(!jQuery(this).hasClass('active') || jQuery(".clickable-row").length == 1){
                    jQuery(this).addClass('active').siblings().removeClass('active');
                    addFilterResponsabile();

                    jQuery(".canvas_style_custom").hide();
                    var myPieChart_1 = new Chart(this.attributes['data-graph'].value+"_1",eval("data"+this.attributes['data-graph'].value+"_1_data"));
                    var myPieChart_1 = new Chart(this.attributes['data-graph'].value+"_2",eval("data"+this.attributes['data-graph'].value+"_2_data"));

                    jQuery("#"+this.attributes['data-graph'].value+"_1").show();
                    jQuery("#"+this.attributes['data-graph'].value+"_2").show();

                    var chart1 = jQuery("#title_chart_1")[0];
                    chart1.innerText = this.attributes['data-user'].value;
                    var chart2 = jQuery("#title_chart_2")[0];
                    chart2.innerText = this.attributes['data-user'].value;
                }else{
                    jQuery("#filterChart").hide();
                    jQuery("#filters-box-deatils").html('');
                    window.saveOtherPass = {};
                    window.searchTextSup = [];
                    window.otherPass =[];
                    window.saveObjSearchText = {};
                    jQuery(this).removeClass('active');

                    jQuery(".canvas_style_custom").hide();
                    jQuery("#chart1").show();
                    jQuery("#chart2").show();

                    var chart1 = jQuery("#title_chart_1")[0];
                    chart1.innerText = "Totale";
                    var chart2 = jQuery("#title_chart_2")[0];
                    chart2.innerText = "Totale";
                }


            });

            if(jQuery(".clickable-row").length == 1){
                jQuery(".clickable-row").trigger("click");
            }

            jQuery(document).ready(function(){
                jQuery("#loadingSelectTotal").hide();
            });
        </script>
        <?php endif;?>


        <script>

            function esportaCSV(){
                var csv = "<?php echo !empty($csvExport) ? $csvExport : "";?>";
                //window.location.href = 'data:text/csv;charset=UTF-8,' + encodeURIComponent(csv);

                var csvContent = "data:text/csv;charset=utf-8,"+csv;

                var encodedUri = encodeURI(csvContent);

                var link = document.createElement("a");
                link.setAttribute("href", encodedUri);
                link.setAttribute("download", "exportAllStat.csv");
                document.body.appendChild(link); // Required for FF

                link.click();
            }

            jQuery(document).ready(function() {
                var table = jQuery('#tableHistoryCustom').dataTable({
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



                jQuery(document).ready(function(){
                    jQuery("#tableHistoryCustom_wrapper").addClass("table-responsive");

                });


                jQuery('input[name="daterange"]').daterangepicker({

                    "locale": {
                        "format": "DD/MM/YYYY",
                        "applyLabel": "<?= JText::_('ADVSEARCH_APPLY') ?>",
                        "cancelLabel": "<?= JText::_('CANCEL') ?>",
                        "fromLabel": "<?= JText::_('ADVSEARCH_FROM') ?>",
                        "toLabel": "<?= JText::_('ADVSEARCH_TO') ?>",
                        "daysOfWeek": [
                            "<?= JText::_('SUN') ?>",
                            "<?= JText::_('MON') ?>",
                            "<?= JText::_('TUE') ?>",
                            "<?= JText::_('WED') ?>",
                            "<?= JText::_('THU') ?>",
                            "<?= JText::_('FRI') ?>",
                            "<?= JText::_('SAT') ?>"
                        ],
                        "monthNames": [
                            "<?= JText::_('JANUARY') ?>",
                            "<?= JText::_('FEBRUARY') ?>",
                            "<?= JText::_('MARCH') ?>",
                            "<?= JText::_('APRIL') ?>",
                            "<?= JText::_('MAY') ?>",
                            "<?= JText::_('JUNE') ?>",
                            "<?= JText::_('JULY') ?>",
                            "<?= JText::_('AUGUST') ?>",
                            "<?= JText::_('SEPTEMBER') ?>",
                            "<?= JText::_('OCTOBER') ?>",
                            "<?= JText::_('NOVEMBER') ?>",
                            "<?= JText::_('DECEMBER') ?>"
                        ]
                    }
                });

                jQuery('input[name="daterange"]').data('daterangepicker').setStartDate('01/01/1990');
            });

            var pathComplete_Portal ="<?php echo GPT_BASE_URL;?>";

            jQuery(document).ready(function() {
                jQuery('input[type=radio][name=option_send]').change(function() {
                    jQuery('input[type=radio][name=option_send1]')[0].checked = false;
                    jQuery(".disabledCustom").hide();
                    jQuery("#disable"+this.value).show();
                    if (this.value == 'PA') {
                        jQuery('#listTYPE').prop('disabled', 'disabled');
                        <?php //if(!$controllo_disabled_select):?>
                        jQuery('#listPA').prop('disabled', false);
                        <?php //endif;?>

                    }else if (this.value == 'TYPE') {
                        <?php //if(!$controllo_disabled_select):?>
                        jQuery('#listPA').prop('disabled', 'disabled');
                        <?php //endif;?>
                        jQuery('#listTYPE').prop('disabled', false);

                    }
                });

                jQuery('input[type=radio][name=option_send1]').change(function() {
                    jQuery('input[type=radio][name=option_send]')[0].checked = false;
                    jQuery(".disabledCustom").hide();
                    jQuery("#disable"+this.value).show();
                    if (this.value == 'PA') {
                        jQuery('#listTYPE').prop('disabled', 'disabled');
                        <?php //if(!$controllo_disabled_select):?>
                        jQuery('#listPA').prop('disabled', false);
                        <?php //endif;?>

                    }else if (this.value == 'TYPE') {
                        <?php //if(!$controllo_disabled_select):?>
                        jQuery('#listPA').prop('disabled', 'disabled');
                        <?php //endif;?>
                        jQuery('#listTYPE').prop('disabled', false);

                    }
                });
            });



            if(jQuery("#listPA")[0].selectedOptions[0].value != "*"){
                eventChange();
            }
            function eventChange(event){

                if(jQuery("#listPA")[0].selectedOptions[0].value){

                    <?php if($controllo_disabled_select):?>
                    var selectedOpt = jQuery("#listPA")[0].selectedOptions[0].value;


                    jQuery('.customSelectPAStatus').empty();
                    var ownerMyPa = "<?php echo $ownerValuePASave;?>";
                    //var select = jQuery(".customSelectPAStatus > option");
                    if(selectedOpt != "s" && selectedOpt != "*"){
                        if(selectedOpt == ownerMyPa){
                            jQuery(".customSelectPAStatus").append(jQuery('<option>', {
                                value: "STATO",
                                text : "<?= JText::_('STATS_STATE') ?>"
                            }));
                            jQuery(".customSelectPAStatus").append(jQuery('<option>', {
                                value: "METODO",
                                text : "<?= JText::_('STATS_METHOD') ?>"
                            }));
                        }
                    }

                    jQuery(".customSelectPAStatus").append(jQuery('<option>', {
                        value: "TIPOLOGIA",
                        text : "<?= JText::_('STATS_TYPE') ?>"
                    }));
                    jQuery(".customSelectPAStatus").append(jQuery('<option>', {
                        value: "CATEGORIA",
                        text : "<?= JText::_('STATS_CATEGORY') ?>"
                    }));
                    jQuery(".customSelectPAStatus").append(jQuery('<option>', {
                        value: "INSPIRE",
                        text : "<?= JText::_('STATS_INSPIRE') ?>"
                    }));
                    jQuery(".customSelectPAStatus").append(jQuery('<option>', {
                        value: "SERVIZIO",
                        text : "<?= JText::_('STATS_SERVICE') ?>"
                    }));

                    <?php if(!empty($criterio_tipo_stat)):?>
                    jQuery(".customSelectPAStatus").val("<?php echo $criterio_tipo_stat;?>");
                    <?php endif;?>

                    <?php endif;?>

                    var valuePa = jQuery("#listPA")[0].selectedOptions[0].value;
                    if(valuePa && valuePa!= "s" && valuePa!= "*"){
                        jQuery.ajax({
                            url: pathComplete_Portal+"/rest/RestUserAddOn/getUserFromPA?PA_ID="+jQuery("#listPA")[0].selectedOptions[0].value,
                            crossDomain: true,
                            success: function(result){
                                result = JSON.parse(result);
                                jQuery('#listOwner').empty();
                                jQuery('#listOwner').append('<option selected="selected" value="*">Tutti</option>');
                                //jQuery('#listOwner').append('<option selected="selected" value="*">Dettaglio</option>');
                                for(var i = 0; i< result.length; i++){

                                    jQuery("#listOwner").append(jQuery('<option>', {
                                        value: result[i].id,
                                        text : result[i].nomeUtente
                                    }));

                                }
                                <?php if(!empty($ownerValuePA)):?>
                                jQuery('#listOwner').val("<?php echo $ownerValuePA;?>");
                                <?php endif;?>
                            }}
                        );
                    }

                }

            };

        </script>

        <style>

            #tableHistoryCustom > tbody > tr.clickable-row.active, #tableHistoryCustom > tbody > tr.clickable-row.active > .noneElement{
                background: #ccc!important;
            }

            #tableHistoryCustom td.active{
                background: #ccc!important;
            }

            .disabledCustom{

            }

            .customLabel{
                margin-top:20px;
            }

            .verticalCustom{
                /* Safari */
                -webkit-transform: rotate(-90deg);

                /* Firefox */
                -moz-transform: rotate(-90deg);

                /* IE */
                -ms-transform: rotate(-90deg);

                /* Opera */
                -o-transform: rotate(-90deg);

                /* Internet Explorer */
                filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
            }

            .orizontalCustom{

            }

            .classTableUtente {
                color: #f5f5f0;
                font-weight: bold;
                background-color: #30373d!important;
                text-transform: uppercase;
                padding: 20px;
            }

            table.dataTable thead .sorting {
                color: #fff!important;
            }

            .noresultClassCustom{
                padding: 20px;
                background: #fff;
                border: 1px solid #30373d;
            }

            .ellipsis{
                color:#fff
            }

            #tableHistoryCustom td, #tableHistoryCustom th {
                max-height: 40px;
                line-height: 15px;
                cursor: pointer;
            }

            .noneElement{
                background: #f3f3f3;
            }

            .customSelectPAStatus > option:disabled{

            }

            tfoot{
                background:white;
            }

            #filters-box-deatils{
                list-style: none;
                padding: 0;
                width: 90%;
                margin-left: 10%;
                margin-bottom: 0;
                display: inline-block;
            }
            #filters-box-deatils > li {
                background: #fff;
                display: inline-block;
                padding: 10px;
                margin: 10px 10px 10px 0;
            }
            #filters-box-deatils > li > i{
                font-weight: normal;
                cursor: pointer;
            }

            #boxLabelFilter{
                display: inline-block;
                top: 40%;
                position: absolute;
            }
            #filterBox {
                position: relative;
            }

            #tableHistoryCustom .active > td.active {
                background: #007e6d!important;
                color: #fff;
                font-weight: bold;
            }
        </style>
