<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
define('COOKIE_DEBUG', false);
require_once JPATH_BASE . '/includes/functions.php';


function getFilterName($filtro, $nomi_filtri){
    foreach($nomi_filtri as $key => $value)
        if(in_array($filtro, explode(",", $value)))
            return $key;
}

/*
 * modifica il valore di un singolo parametro nell'url
 * @author paolo martufi 2017-06-27
 */
function updateParamInUrl($url, $param_key, $param_value){
    $exploded_url = explode("?", $url);
    $base = $exploded_url[0];
    $params = explode("&", $exploded_url[1]);
	
    foreach($params as $i => $param)
        if( getKeyFromEcondedParam($param) == $param_key )
            $params[$i] = $param_key . "=" . $param_value;
    return $base . "?" . implode("&", $params);
}

/*
 * restituisce la parte sinistra di una stringa separata dal simbolo "="
 * @author paolo martufi 2017-06-27
 */
function getKeyFromEcondedParam($param){
    return explode("=", $param)[0];
}

/*
 * restituisce la parte destra di una stringa separata dal simbolo "="
 * @author paolo martufi 2017-06-28
 */
function getValueFromEcondedParam($param){
    return explode("=", $param)[1];
}

function translateKey($text,$resize = false, $debug = false){
    //if($debug) echo "step 1 = > ".$text."<br>";
//    $textNew = get_text($text);
//    if($textNew != $text && !empty($textNew)) return $textNew;

// Questa matrice serve a tradurre le chiavi che arrivano dai metadati nelle etichette necessarie
// Per emplicità non viene utilizzato il file di traduzione
// Alcune chiavi possono arrivare in italiano o in inglese, quindi ci sono entrambe
    $arrayTranslate = array(
        "it"=> array(
            // Stato.
            "approved"           => "Approvato",
            "disapproved"        => "In cancellazione",
            "To be canceled"     => "In cancellazione",
            "incomplete"         => "Da cancellare",
            "draft"              => "Bozza",
            "canceled"           => "Cancellato",
            "posted"             => "Inviato",

            "Approvato"          => "Approvato",
            "In cancellazione"   => "In cancellazione",
            "Da cancellare"       => "Da cancellare",
            "Bozza"              => "Bozza",
            "Cancellato"         => "Cancellato",
            "Inviato"            => "Inviato",

            // Metodo di pubblicazione.
            "upload"            => "Caricato",
            "Uploaded"          => "Caricato",
            "editor"            => "Editato",
            "Edited"            => "Editato",
            "harvester"         => "Raccolto",
            "Harvested"         => "Raccolto",
            "Registered"        => "Registrato",
            "registration"      => "Registrato",

            "Caricato"          => "Caricato",
            "Editato"           => "Editato",
            "Raccolto"          => "Raccolto",
            "Registrato"        => "Registrato",

            //tipo dato.
            "service"           => "Servizio",
            "servizio"          => "Servizio",
            "014"           	=> "Servizio",
            "dataset"           => "Dataset",
            "005"				=> "Dataset",
            "series"            => "Serie",
            "serie"            	=> "Serie",
            "006"				=> "Serie",
            "model"             => "Nuove acquisizioni",

            //Tipo servizio.
            "discovery"         => "Ricerca",
            "download"          => "Scaricamento",
            "invoke"            => "Chiamata",
            "other"             => "Altro",
            "transformation"    => "Trasformazione",
            "view"              => "Visualizzazione",

            "Ricerca"           => "Ricerca",
            "Scaricamento"      => "Scaricamento",
            "Chiamata"          => "Chiamata",
            "Altro"             => "Altro",
            "Trasformazione"    => "Trasformazione",
            "Visualizzazione"   => "Visualizzazione",

            //Categorie ISO.
            "inlandwaters"                      => "Acque interne",
            "oceans"                            => "Acque marine - Oceani",
            "farming"                           => "Agricoltura",
            "environment"                       => "Ambiente",
            "biota"                             => "Biota",
            "climatologymeteorologyatmosphere"  => "Climatologia - Metereologia - Amosfera",
            "boundaries"                        => "Confini",
            "economy"                           => "Economia",
            "elevation"                         => "Elevazione",
            "geoscientificinformation"          => "Informazioni geoscientifiche",
            "intelligencemilitary"              => "Intelligence - Settore militare",
            "location"                          => "Localizzazione",
            "imagerybasemapsearthcover"         => "Mappe di base - Immagini - Copertura terrestre",
            "planningcadastre"                  => "Pianificazione - Catasto",
            "health"                            => "Salute",
            "utilitiescommunication"            => "Servizi di pubblica utilità - Comunicazione",
            "society"                           => "Società",
            "structure"                         => "Strutture",
            "transportation"                    => "Trasporti",

            "Inland Waters"                                         => "Acque interne",
            "Oceans"                                                => "Acque marine - Oceani",
            "Farming"                                               => "Agricoltura",
            "Environment"                                           => "Ambiente",
            //"Biota"                                               => "Biota",
            "Climatology - Meteorology - Atmosphere"                => "Climatologia - Metereologia - Amosfera",
            "Boundaries"                                            => "Confini",
            "Economy"                                               => "Economia",
            "Elevation"                                             => "Elevazione",
            "Geoscientific Information"                             => "Informazioni geoscientifiche",
            "Intelligence Military"                                 => "Intelligence - Settore militare",
            "Location"                                              => "Localizzazione",
            "Imagery BaseMaps EarthCover"                           => "Mappe di base - Immagini - Copertura terrestre",
            "Planning Cadastre"                                     => "Pianificazione - Catasto",
            "Health"                                                => "Salute",
            "Utilities Communication"                               => "Servizi di pubblica utilità - Comunicazione",
            "Society"                                               => "Società",
            "Structure"                                             => "Strutture",
            "Transportation"                                        => "Trasporti",

            "Acque interne"                     => "Acque interne",
            "Acque marine - Oceani"             => "Acque marine - Oceani",
            "Agricoltura"                       => "Agricoltura",
            "Ambiente"                          => "Ambiente",
            "Biota"                             => "Biota",
            "Climatologia - Metereologia - Amosfera"  => "Climatologia - Metereologia - Amosfera",
            "Confini"                           => "Confini",
            "Economia"                          => "Economia",
            //"Elevazione"                        => "Elevazione",
            "Informazioni geoscientifiche"      => "Informazioni geoscientifiche",
            "Intelligence - Settore militare"   => "Intelligence - Settore militare",
            "Localizzazione"                    => "Localizzazione",
            "Mappe di base - Immagini - Copertura terrestre"         => "Mappe di base - Immagini - Copertura terrestre",
            "Pianificazione - Catasto"          => "Pianificazione - Catasto",
            "Salute"                            => "Salute",
            "Servizi di pubblica utilità - Comunicazione"            => "Servizi di pubblica utilità - Comunicazione",
            "Società"                           => "Società",
            "Strutture"                         => "Strutture",
            "Trasporti"                         => "Trasporti",

            // TEMI INSPIRE. Queste purtroppo possono arivare in italiano o in inglese
            "Condizioni atmosferiche"                               => "Condizioni atmosferiche",
            "Copertura del suolo"                                   => "Copertura del suolo",
            "Distribuzione della popolazione - demografia"          => "Distribuzione della popolazione - demografia",
            "Distribuzione della popolazione _ demografia"          => "Distribuzione della popolazione - demografia",
            "Distribuzione della popolazione ? demografia"          => "Distribuzione della popolazione - demografia",
            "Distribuzione delle specie"                            => "Distribuzione delle specie",
            "Edifici"                                               => "Edifici",
            "Elementi geografici meteorologici"                     => "Elementi geografici meteorologici",
            "Elementi geografici oceanografici"                     => "Elementi geografici oceanografici",
            "Elevazione"                                            => "Elevazione",
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
            // Inglese
            "Atmospheric conditions"                                => "Condizioni atmosferiche",
            "Land cover"                                            => "Copertura del suolo",
            "Population distribution - demography"                  => "Distribuzione della popolazione - demografia",
            "Population distribution _ demography"                  => "Distribuzione della popolazione - demografia",
            "Population distribution ? demography"                  => "Distribuzione della popolazione - demografia",
            "Species distribution"                                  => "Distribuzione delle specie",
            "Buildings"                                             => "Edifici",
            "Meteorological geographical features"                  => "Elementi geografici meteorologici",
            "Oceanographic geographical features"                   => "Elementi geografici oceanografici",
            //"Elevation"                                             => "Elevazione",
            "Geology"                                               => "Geologia",
            "Habitats and biotopes"                                 => "Habitat e biotopi",
            "Hydrography"                                           => "Idrografia",
            "Agricultural and aquaculture facilities"               => "Impianti agricoli e di acquacoltura",
            "Environmental monitoring facilities"                   => "Impianti di monitoraggio ambientale",
            "Addresses"                                             => "Indirizzi",
            "Geographical names"                                    => "Nomi geografici",
            "Orthoimagery"                                          => "Orto immagini",
            "Cadastral parcels"                                     => "Parcelle catastali",
            "Production and industrial facilities"                  => "Produzione e impianti industriali",
            "Bio-geographical regions"                              => "Regioni biogeografiche",
            "Sea regions"                                           => "Regioni marine",
            "Transport networks"                                    => "Reti di trasporto",
            "Energy resources"                                      => "Risorse energetiche",
            "Mineral resources"                                     => "Risorse minerarie",
            "Human health and safety"                               => "Salute umana e sicurezza",
            "Utility and governmental services"  					=> "Servizi di pubblica utilità e servizi amministrativi",
            "Coordinate reference systems"                          => "Sistemi di coordinate",
            "Geographical grid systems"                             => "Sistemi di griglie geografiche",
            "Protected sites"                                       => "Siti protetti",
            "Soil"                                                  => "Suolo",
            "Administrative units"                                  => "Unità amministrative",
            "Statistical units"                                     => "Unità statistiche",
            "Land use"                                              => "Utilizzo del territorio",
            "Natural risk zones"                                    => "Zone a rischio naturale",
            "Area management/restriction/regulation zones and reporting units" =>"Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati"
        ),
        "en"=> array(
            // Stato. Queste chiavi arrivano sempre in inglese perché arrivano dal GPT
            "approved"           => "Approved",
            "disapproved"        => "To be canceled",
            "To be canceled"     => "To be canceled",
            "incomplete"         => "Incomplete",
            "draft"              => "Draft",
            "canceled"           => "Canceled",
            "posted"             => "Posted",

            "Approvato"          => "Approved",
            "In cancellazione"   => "To be canceled",
            "Da cancellar"       => "Incomplete",
            "Bozza"              => "Draft",
            "Cancellato"         => "Canceled",
            "Inviato"            => "Posted",

            // Metodo di pubblicazione. Queste chiavi arrivano sempre in inglese perché arrivano dal GPT
            "upload"            => "Uploaded",
            "Uploaded"          => "Uploaded",
            "editor"            => "Edited",
            "Edited"            => "Edited",
            "harvester"         => "Harvested",
            "Harvested"         => "Harvested",
            "Registered"        => "Registered",
            "registration"      => "Registered",

            "Caricato"          => "Uploaded",
            "Editato"           => "Edited",
            "Raccolto"          => "Harvested",
            "Registrato"        => "Registered",

            //tipo dato. Queste chiavi vengono codificate nei metadati quindi sono solo in inglese
            "service"           => "Service",
            "servizio"          => "Service",
            "014"           	=> "Service",
            "dataset"           => "Dataset",
            "005"				=> "Dataset",
            "series"            => "Series",
            "serie"            	=> "Series",
            "006"				=> "Series",
            "model"             => "New acquisition",

            //Tipo servizio. Queste chiavi vengono codificate nei metadati quindi sono solo in inglese
            "discovery"         => "Discovery",
            "download"          => "Download",
            "invoke"            => "Invoke",
            "other"             => "Other",
            "transformation"    => "Transformation",
            "view"              => "View",

            "Ricerca"           => "Discovery",
            "Scaricamento"      => "Download",
            "Chiamata"          => "Invoke",
            "Altro"             => "Other",
            "Trasformazione"    => "Transformation",
            "Visualizzazione"   => "View",

            //Categorie ISO. Queste chiavi vengono codificate nei metadati quindi sono solo in inglese
            "inlandwaters"                                          => "Inland Waters",
            "oceans"                                                => "Oceans",
            "farming"                                               => "Farming",
            "environment"                                           => "Environment",
            "biota"                                                 => "Biota",
            "climatologymeteorologyatmosphere"                      => "Climatology - Meteorology - Atmosphere",
            "boundaries"                                            => "Boundaries",
            "economy"                                               => "Economy",
            "elevation"                                             => "Elevation",
            "geoscientificInformation"                              => "Geoscientific Information",
            "intelligencemilitary"                                  => "Intelligence Military",
            "location"                                              => "Location",
            "imagerybasemapsearthcover"                             => "Imagery BaseMaps EarthCover",
            "planningcadastre"                                      => "Planning Cadastre",
            "health"                                                => "Health",
            "utilitiescommunication"                                => "Utilities Communication",
            "society"                                               => "Society",
            "structure"                                             => "Structure",
            "transportation"                                        => "Transportation",

            "Inland Waters"                                          => "Inland Waters",
            "Oceans"                                                => "Oceans",
            "Farming"                                               => "Farming",
            "Environment"                                           => "Environment",
            //"Biota"                                                 => "Biota",
            "Climatology - Meteorology - Atmosphere"                => "Climatology - Meteorology - Atmosphere",
            "Boundaries"                                            => "Boundaries",
            "Economy"                                               => "Economy",
            "Elevation"                                             => "Elevation",
            "Geoscientific Information"                              => "Geoscientific Information",
            "Intelligence Military"                                  => "Intelligence Military",
            "Location"                                              => "Location",
            "Imagery BaseMaps EarthCover"                             => "Imagery BaseMaps EarthCover",
            "Planning Cadastre"                                      => "Planning Cadastre",
            "Health"                                                => "Health",
            "Utilities Communication"                                => "Utilities Communication",
            "Society"                                               => "Society",
            "Structure"                                             => "Structure",
            "Transportation"                                        => "Transportation",

            "Acque interne"                     => "Inland Waters",
            "Acque marine - Oceani"             => "Oceans",
            "Agricoltura"                       => "Farming",
            "Ambiente"                          => "Environment",
            "Biota"                             => "Biota",
            "Climatologia - Metereologia - Amosfera"  => "Climatology - Meteorology - Atmospher",
            "Confini"                           => "Boundaries",
            "Economia"                          => "Economy",
            "Elevazione"                        => "Elevation",
            "Informazioni geoscientifiche"      => "Geoscientific Information",
            "Intelligence - Settore militare"   => "Intelligence Military",
            "Localizzazione"                    => "Location",
            "Mappe di base - Immagini - Copertura terrestre"         => "Imagery BaseMaps EarthCover",
            "Pianificazione - Catasto"          => "Planning Cadastre",
            "Salute"                            => "Health",
            "Servizi di pubblica utilità - Comunicazione"            => "Utilities Communication",
            "Società"                           => "Society",
            "Strutture"                         => "Structure",
            "Trasporti"                         => "Transportation",

            // TEMI INSPIRE
            "Condizioni atmosferiche"                               => "Atmospheric conditions",
            "Copertura del suolo"                                   => "Land cover",
            "Distribuzione della popolazione - demografia"          => "Population distribution - demography",
            "Distribuzione della popolazione _ demografia"          => "Population distribution - demography",
            "Distribuzione della popolazione ? demografia"          => "Population distribution - demography",
            "Distribuzione delle specie"                            => "Species distribution",
            "Edifici"                                               => "Buildings",
            "Elementi geografici meteorologici"                     => "Meteorological geographical features",
            "Elementi geografici oceanografici"                     => "Oceanographic geographical features",
            "Elevazione"                                            => "Elevation",
            "Geologia"                                              => "Geology",
            "Habitat e biotopi"                                     => "Habitats and biotopes",
            "Idrografia"                                            => "Hydrography",
            "Impianti agricoli e di acquacoltura"                   => "Agricultural and aquaculture facilities",
            "Impianti di monitoraggio ambientale"                   => "Environmental monitoring facilities",
            "Indirizzi"                                             => "Addresses",
            "Nomi geografici"                                       => "Geographical names",
            "Orto immagini"                                         => "Orthoimagery",
            "Parcelle catastali"                                    => "Cadastral parcels",
            "Produzione e impianti industriali"                     => "Production and industrial facilities",
            "Regioni biogeografiche"                                => "Bio-geographical regions",
            "Regioni marine"                                        => "Sea regions",
            "Reti di trasporto"                                     => "Transport networks",
            "Risorse energetiche"                                   => "Energy resources",
            "Risorse minerarie"                                     => "Mineral resources",
            "Salute umana e sicurezza"                              => "Human health and safety",
            "Servizi di pubblica utilità e servizi amministrativi"  => "Utility and governmental services",
            "Sistemi di coordinate"                                 => "Coordinate reference systems",
            "Sistemi di griglie geografiche"                        => "Geographical grid systems",
            "Siti protetti"                                         => "Protected sites",
            "Suolo"                                                 => "Soil",
            "Unità amministrative"                                  => "Administrative units",
            "Unità statistiche"                                     => "Statistical units",
            "Utilizzo del territorio"                               => "Land use",
            "Zone a rischio naturale"                               => "Natural risk zones",
            "Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati" => "Area management/restriction/regulation zones and reporting units",

            "Atmospheric conditions"                                => "Atmospheric conditions",
            "Land cover"                                            => "Land cover",
            "Population distribution - demography"                  => "Population distribution - demography",
            "Population distribution _ demography"                  => "Population distribution - demography",
            "Population distribution ? demography"                  => "Population distribution - demography",
            "Species distribution"                                  => "Species distribution",
            "Buildings"                                             => "Buildings",
            "Meteorological geographical features"                  => "Meteorological geographical features",
            "Oceanographic geographical features"                   => "Oceanographic geographical features",
            //"Elevation"                                             => "Elevation",
            "Geology"                                               => "Geology",
            "Habitats and biotopes"                                 => "Habitats and biotopes",
            "Hydrography"                                           => "Hydrography",
            "Agricultural and aquaculture facilities"               => "Agricultural and aquaculture facilities",
            "Environmental monitoring facilities"                   => "Environmental monitoring facilities",
            "Addresses"                                             => "Addresses",
            "Geographical names"                                    => "Geographical names",
            "Orthoimagery"                                          => "Orthoimagery",
            "Cadastral parcels"                                     => "Cadastral parcels",
            "Production and industrial facilities"                  => "Production and industrial facilities",
            "Bio-geographical regions"                              => "Bio-geographical regions",
            "Sea regions"                                           => "Sea regions",
            "Transport networks"                                    => "Transport networks",
            "Energy resources"                                      => "Energy resources",
            "Mineral resources"                                     => "Mineral resources",
            "Human health and safety"                               => "Human health and safety",
            "Utility and governmental services"  					=> "Utility and governmental services",
            "Coordinate reference systems"                          => "Coordinate reference systems",
            "Geographical grid systems"                             => "Geographical grid systems",
            "Protected sites"                                       => "Protected sites",
            "Soil"                                                  => "Soil",
            "Administrative units"                                  => "Administrative units",
            "Statistical units"                                     => "Statistical units",
            "Land use"                                              => "Land use",
            "Natural risk zones"                                    => "Natural risk zones",
            "Area management/restriction/regulation zones and reporting units" =>"Area management/restriction/regulation zones and reporting units"

        )
    );

    // Se sono sicuro che non c'è torno subito
    if ($text == "" || $text == "null")
        return null;

    $lang = JFactory::getLanguage();
    $lang_code = substr($lang->getTag(), 0,2);
    foreach ($arrayTranslate[$lang_code] as $key => $value){

        //if($debug) echo $key . " => " . $value . "<br>";

        if(strtolower($text) == strtolower($key)){
            if($debug) echo "TROVATO => " . $value . "<br>";
            return $value;
        }
    }

    if($debug) echo "step 4 = > ".$text."<br>";

    if($debug) echo "<br><br><br>";
    return null;

}

function translateFilter($text){

    $arrayTranslate = array(
        "it" => array(
            "text_free_search"  => "Testo libero",
            "keywords"          => "Parola chiave",
            "PriorityDataset"   => "Dataset prioritari",
            "OpenDataTheme"     => "Temi open data",
            "OpenData"          => "Open data",
            "inspireThemes"     => "Temi INSPIRE",
            "services"          => "Tipo servizio",
            "admin_resp"        => "Responsabile",
            "date"              => "Quando",
            "type"              => "Profilo",

            "bbox"              => "Dove",
            "category"          => "Categoria ISO"
            //"orderBy"           => "Ordinamento"
        ),
        "en" => array(
            "text_free_search"  => "Anytext",
            "keywords"          => "Keywords",
			"PriorityDataset"   => "Priority dataset",
            "OpenDataTheme"     => "Open data themes",
            "OpenData"          => "Open data",
            "inspireThemes"     => "INSPIRE themes",
            "services"          => "Service type",
            "admin_resp"        => "Responsible",
            "date"              => "When",
            "type"              => "Profile",

            "bbox"              => "Where",
            "category"          => "Topic category"
            //"orderBy"           => "Order"
        )
        
    );
    $lang = JFactory::getLanguage();
    $lang_code = substr($lang->getTag(), 0,2);
    foreach ($arrayTranslate[$lang_code] as $key => $value){
        if(strtolower($text) == strtolower($key)){
           // if($debug) echo "TROVATO => " . $value . "<br>";
            return $value;
        }
    }
    return null;
}

function generateDefineUrl($urlGeoportal,$params) {

    $count = 1;
    foreach($params as $key=>$value){
        $urlGeoportal .= $count++ <= 1 ? "?" : "&";
        $urlGeoportal .= $key . "=" . $value;
    }
    return $urlGeoportal;
}

function startsWith($haystack, $needle){
    $length = strlen($needle);
    return (substr($haystack, 0, $length) === $needle);
}


//paginazione
$num_paged = 15;
$page_num = 1;

if(!empty($_GET['paged'])){
    $paged = str_replace("\'","",$_GET['paged']);
    $page_num = $paged;
    $paged = ($paged*$num_paged)-$num_paged+1;
}else{
    $paged = 1;
}

$keyword = (!empty($_GET['keyword'])) ? $_GET['keyword'] : '';
$parametri_1 = "?max=15&searchText=$keyword";
$parametri_2 = "&start=$paged&max=".$num_paged;

//$url = encodeUrl(GPT_REST_URL_SERVER . $parametri_1 . $parametri_2 );
$url = GPT_REST_URL_SERVER . $parametri_1 . $parametri_2;

$arrayQuery = explode("&", $url);


for($i = 0; $i < count($arrayQuery); ++$i) {
    if (0 === strpos($arrayQuery[$i], 'searchText=')) {
        $arrayQuery[$i]= 'searchText=' . rawurlencode(substr($arrayQuery[$i],11));
    }
}
$url= implode("&", $arrayQuery);

$nomi_filtri = get_text("home.inspire_cluster")['metadataFilters'][$lang_code];
$datiRicerca = '';
$datiRicercaUrl = '';

/*
 * Condizione per gestire l'eliminazione dei cookie a seconda della pagina di provenienza:
 * home => vanno eliminati i cookie di ricerca
 * ricercaDettagliata => non vanno eliminati i cookie, servono per la paginazione
 * @author paolo martufi 2017-06-27
 *
 * Fix: Bug 154
 * È stato spostato prima della condizione if(!empty($_COOKIE['datiRicerca']) && !empty($_COOKIE['datiRicercaUrl']) && empty($keyword)){
 * perché altrimenti non venivano resettati i cookie se già preimpostati, e rimuovendo il filtro, venivano rigenerati in base alle informazioni
 * presenti nel cookie: comparivano quindi i filtri impostati nella ricerca dettagliata
 * @author paolo martufi 2017-06-28
 */
if(!empty($_COOKIE['refer_url']) && $_COOKIE['refer_url'] == "home") {
    setcookie('datiRicerca', null, -1, '/');
    setcookie('datiRicercaUrl', null, -1, '/');
    //setcookie('saveObjSearchText', null, -1, '/');
    setcookie('saveCompositeStr', null, -1, '/');
    
    /*
     * FIX: Bug 156
     */
    $_COOKIE['datiRicerca'] = "";
    $_COOKIE['datiRicercaUrl'] = "";
    $_COOKIE['saveCompositeStr'] = "";
    //$_COOKIE['saveObjSearchText'] = "";
}

if(COOKIE_DEBUG) {
    echo "cookie refer_url:<br><br>";
    echo($_COOKIE['refer_url']);
    echo "<br><br><br>";
    echo "cookie datiRicerca:<br><br>";
    echo($_COOKIE['datiRicerca']);
    echo "<br><br><br>";
    echo "cookie datiRicercaUrl:<br><br>";
    echo($_COOKIE['datiRicercaUrl']);
    echo "<br><br><br>";
}


$filters = array();
if(!empty($_COOKIE['saveCompositeStr']) && !empty($_COOKIE['saveObjSearchText']) && !empty($_COOKIE['datiRicercaUrl']) && empty($keyword)){

    //new variable cookie
    $saveCompositeStr = $_COOKIE['saveCompositeStr'];
    $saveObjSearchText = $_COOKIE['saveObjSearchText'];

    $datiRicerca = $_COOKIE['datiRicerca'];
    $datiRicercaUrl = $_COOKIE['datiRicercaUrl'];


    if(COOKIE_DEBUG)
    {
        echo "url updateParamInUrl:<br><br>";
        echo($url);
        echo "<br><br><br>";
    }



    /*
    $data = explode('&',$datiRicerca);
    //echo '<pre>';print_r($data);echo '</pre>';

    foreach($data as $item) {
        $info = explode('=',$item);
        $infoSave = explode('=',$item);

        $control = true;
        foreach($nomi_filtri as $key => $value){
            if(in_array($info[0],explode(",",$value))){
                $info[0] = $key;
                $control = false;
            }
        }
        if($infoSave[0] == "inspireThemes" || $control || $info[1] == "" || $info[1] == "all" || $info[1] == "-1") continue;

        $nome_filtro = array_search($info[0], $nomi_filtri);

        if(!$nome_filtro) $nome_filtro = $info[0];

        if(empty($filters[$nome_filtro]))
            $filters[$nome_filtro] = '';
        else if(
            $nome_filtro == "Quando" ||
            $nome_filtro == "When" ||
            $nome_filtro == "Tema INSPIRE" ||
            $nome_filtro == "INSPIRE Theme"
        )
            $filters[$nome_filtro] .= ' - ';

        $filters[$nome_filtro] .= $info[1];
        $filters_link[$nome_filtro] = $item;

        if($info[0] == "inspireThemes-checkbox"){
            $arrayExp = explode('" AND "',$filters_link[$nome_filtro]);
            $filters_link[$nome_filtro] = $arrayExp[count($arrayExp) - 1];
        }

        if($info[0] == "data-a" || $info[0] == "data-da")
            if(!(strpos($filters_link[$nome_filtro], '-') !== false))
                $filters_link[$nome_filtro] = null;
    }*/

    //riscrittura filtri
    $arraySupText = array();
    $saveObjSearchText = (array) json_decode($saveObjSearchText);

    if(count($saveObjSearchText) != 0){

        foreach ($saveObjSearchText as $key => $value){
            $translate = translateFilter($key);
            if($translate) $filters[$translate] = $value;
            array_push($arraySupText,$value);

        }
    }

    $saveCompositeStr = (array) json_decode($saveCompositeStr);

    $arraySupComposite = array();
    if(count($saveCompositeStr) != 0){

        foreach ($saveCompositeStr as $key => $value){
            $translate = translateFilter($key);
            if($translate) $filters[$translate] = $value;
            array_push($arraySupComposite,$value);
        }
    }

    $sm = startsWith($arraySupText[0],"(")? "* AND " : "";
    $text2 = rawurlencode($sm.implode(" AND ", $arraySupText));
    if($text2 == "") $text2 = "*";
    $searchText = "searchText=".$text2;

    array_push($arraySupComposite,$searchText);

    $adapt = implode("&",$arraySupComposite);
    $params = array(
        "start"=> $paged,
        "max"=> $num_paged,
        "geometryType"=> "esriGeometryBox",
    );


    $url = generateDefineUrl(GPT_REST_URL_SERVER,$params) ."&". $adapt ;//"&f=json";

	
//var_dump($url);
}

if(!empty($keyword)){
	
	if(!(strpos($keyword, 'INSPIRETheme') !== false)){
		$translate = translateFilter("text_free_search");
		if($translate) $filters[$translate] = $keyword;
	}else{
		$translate = translateFilter("inspireThemes");
		$slipt = explode(":", $keyword);
		if($translate) $filters[$translate] = $slipt[1];
	}
	
	
}


$opts = array(
    'http'=>array(
        'method'=>"GET",
        'header'=>"Accept-language: en\r\n" .
            "Cookie: foo=bar\r\n" //.
            //"Content-Type: text/xml; charset=utf-8\r\n"
    )
);

$context = stream_context_create($opts);

//pezzo aggiunto Nicol

/*
$arrayQuery = explode("&", $url);


for($i = 0; $i < count($arrayQuery); ++$i) {
    if (0 === strpos($arrayQuery[$i], 'searchText=')) {
        $arrayQuery[$i]= 'searchText=' . rawurlencode(substr($arrayQuery[$i],11));
    }
}
$url= implode("&", $arrayQuery);


*/

$allItemsUrlClient = $url;
$url .= "&f=json";


//NICOL $url = encodeUrl($url);
//NICOL $url = str_replace(" ","%20",$url);

//echo $url;
//var_dump($url);

$html = file_get_contents($url,false,$context);

$json = preg_replace('/,\s*([\]}])/m', '$1', utf8_encode($html));
$json = json_decode($html,true);



$records = $json['records'];


//ultimo item della pagina
$pageLastRecord = $paged+($num_paged-1);

if($pageLastRecord>$json['totalResults']) $pageLastRecord=$json['totalResults'];

$arrayINSPIREtheme	= get_text('home.inspire_cluster')['inspireThemes'];
$arraybuttons		= get_text('home.inspire_cluster')['metadataButtons'];


//if(!empty($_GET['keyword']) && !(strpos(htmlentities($_GET['keyword']), 'INSPIRETheme') !== false)) $filters[getFilterName('text-free', $nomi_filtri)] =  htmlentities($_GET['keyword']);

$arraySup = !empty($_GET['keyword']) ? explode(':',htmlentities($_GET['keyword'])) : [];

//if(!empty($_GET['keyword']) && strpos(htmlentities($_GET['keyword']), 'INSPIRETheme') !== false && count($arraySup) != 0) $filters[getFilterName('inspireThemes', $nomi_filtri)] =  str_replace(htmlentities('"'), '', $arraySup[1]);

?>
<div class="article_header default_header">
    <div class="over-article">
        <div class="container">
            <div class="row">
                <div class="col-md-12 white">
                    <?= JHtml::_('content.prepare', '{loadmodule breadcrumbs}') ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-9 white">
                    <h1><?= JText::_('METADATA') ?></h1>
                </div>
                <div class="col-md-3 bwhite vedi-carrello">
                    <span id="nCartElement_1" class="bgreen white p10">0</span>
                    <span class="green bold left25" data-toggle="modal" data-target="#modalCart" tabindex="0"><?= JText::_('OPEN_CART') ?></span>
                    <?php
                    /* Cart Esri italia */
                    echo getContent('cart.modal-cart');
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
<style>ul.breadcrumb>li>a>span,ul.breadcrumb>li>span,ul.breadcrumb>li{font-size:medium;font-weight:normal;color:#fff!important;}</style>

<?php if(!empty($filters)){ ?>
    <div class="bgrey">
        <div class="container-fluid left25 right25">
            <div class="row top20">
                <div class="col-md-12 bold left5">
                    <?= JText::_('METADATA_FILTERS') ?>:
                </div>
            </div>
            <div class="row bottom30">
                <div class="col-md-12">
                    <?php foreach($filters as $filter_key=>$filter_value){ ?>
                        <div class="filter bold top10" title="<?= htmlentities($filter_value); ?>">
                            <?= $filter_key ?>
                            <span title="Rimuovi filtro" class="remove_filter" data-filter="<?= htmlentities($filter_value); ?>">&times;</span>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
<?php } ?>

<div class="container top20 bottom100">
    <?php
    //todo alcune volte il json arriva corrotto

    if(empty($json['totalResults'])){
        ?>
        <h3><?= JText::_('NO_RESULTS') ?></h3>
		<div class="container-fluid">
            <div class="row">
                <div class="col-xs-6 bold green" >
                    
                         <!--Bug 146
                         Con la paginazione tornare indietro non porta sempre alla pagina di Ricerca Dettagliata-->
					<a onclick="controlAndGo();">
						<!--<a onclick="window.history.go(-<?=$page_num?>);">-->
							<img src="<?= $baseurls ?>images/icons/Back.png" alt="<?= JText::_('BACK_TO_ADVANCED_SEARCH') ?>" /> <?= JText::_('BACK_TO_ADVANCED_SEARCH') ?>
						<!--</a>-->
                    </a>
                </div>
            </div>
            <hr>
        </div>
        <?php
    } else {
        ?>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-6 bold green" style="<?= $datiRicerca && $_COOKIE['refer_url'] == "ricercaDettagliata" ? '' : 'visibility:hidden;' ?>">
                    
                         <!--Bug 146
                         Con la paginazione tornare indietro non porta sempre alla pagina di Ricerca Dettagliata-->
					<a onclick="controlAndGo();">
						<!--<a onclick="window.history.go(-<?=$page_num?>);">-->
							<img src="<?= $baseurls ?>images/icons/Back.png" alt="<?= JText::_('BACK_TO_ADVANCED_SEARCH') ?>" /> <?= JText::_('BACK_TO_ADVANCED_SEARCH') ?>
						<!--</a>-->
                    </a>
                </div>
                <div class="col-xs-6 text-right">
                    <?= JText::_('RESULTS') ?> <strong><?= $paged .'-'. $pageLastRecord ?></strong> <?= JText::_('OF') ?> <strong><?= $json['totalResults'] ?></strong>
                </div>
            </div>
            <hr>
        </div>
        <?php

        for ($i=0; $i<count($records); $i++) {
            $classIcon = '';
            switch($records[$i]['hierarchyLevel']) {
                case '005':
                    $classIcon = 'dataset';
                    break;
                case '006':
                    $classIcon = 'series';
                    break;
                case '014':
                    $classIcon = 'service';
                    break;
                default:
                    $classIcon = $records[$i]['hierarchyLevel'];
            }

            $classIcon = strtoupper($classIcon);

            if($lang_code=='it')
                if($classIcon=='SERIES')
                    $classIcon='SERIE';
                elseif($classIcon=='SERVICE')
                    $classIcon='SERVIZIO';

            ?>

            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-9">

                        <div class="row">
                            <div class="col-md-6 col-xs-6">
                                <h5 class="hierarchyLevel bold">
                                    <?= $classIcon ?>
                                </h5>
                            </div>
                            <div class="col-md-6 col-xs-6">

                                <h6 class="pull-right">
						<span class="add-to-cart checkbox">
							<label for="add_to_cart_<?= $i ?>">
                                <input type="checkbox" id="add_to_cart_<?= $i ?>" title="" id-element-cart="<?php echo $records[$i]['id'];?>" onclick="controlCheckBox(<?php echo $i;?>,this,'<?php echo str_replace("'","\'", str_replace('"',"&quot;", strtoupper($records[$i]['title'])));?>');">
                                &nbsp;<?= JText::_('ADD_TO_CART') ?>
                            </label>
						</span>
                                </h6>
                            </div>
                        </div>

                        <h3 style="text-transform:uppercase">
					
                            <?= $records[$i]['title'] ?>
                        </h3>

                        <p><?php echo $records[$i]['summary'];?></p>

                        <div class="row">
                            <div class="col-md-12">
                                <?php
                                $iconeVisualizzate = [];

                                //var_dump($records[$i]['keywords']);
								$controlServices = $classIcon != "SERVIZIO" ;

								if($controlServices):
									for($ii=0;$ii<count($records[$i]['keywords']);$ii++) {
                                        $value_Convert = $records[$i]['keywords'][$ii];

										foreach($arrayINSPIREtheme as $key=>$value) {


											if($value_Convert == $value and !in_array($value, $iconeVisualizzate)) {
												$iconeVisualizzate[] = $value;
												?>
												<span class="floatL" title="<?= translateKey($value);?>">

											<?php $theme_img = substr($key, 0, 2); ?>

													<div style="background:url('<?= $baseurls ?>images/inspire/temi/<?= $theme_img ?>.png');background-size:cover;background-position:center;width:30px;height:30px;"></div>
											</span>

											<?php }
										}
									} 
								endif;?>
                            </div>
                        </div>

                        <hr>

                        <?php if(!empty($records[$i]['responsibleOfData']) or !empty($records[$i]['pointOfContactOfData']['name'])): ?>

                            <div class="row">
                                <div class="col-md-12 collapse_btn" data-toggle="collapse" data-target="#collapse<?= $i ?>" aria-expanded="false" tabindex="0">
                                    <?= JText::_('METADATA_SHOW_DETAILS') ?>
                                    <span class="plus pull-right x-large">+</span>
                                </div>
                            </div>

                            <div class="collapse" id="collapse<?=$i ?>">
                                <?php if(!empty($records[$i]['responsibleOfData'])): ?>
                                    <div class="row top20">
                                        <div class="col-md-12">
                                            <?php //if($records[$i]['responsibleOfData'] != $records[$i]['pointOfContactOfData']['name']): ?>
                                            <?= JText::_('METADATA_RESPONSIBLE') ?>:<br>
                                            <?php //endif; ?>
                                            <h4><?= ($records[$i]['responsibleOfData']); ?></h4>
                                        </div>
                                    </div>
                                <?php endif; ?>

                                <div class="row">
                                    <div class="col-md-12">

                                        <?php if(!empty($records[$i]['pointOfContactOfData']['name'])): //and ($records[$i]['responsibleOfData'] != $records[$i]['pointOfContactOfData']['name'])): ?>
                                            <?= JText::_('METADATA_CONTACT') ?>:<br><h4><?= ($records[$i]['pointOfContactOfData']['name']); ?></h4>
                                        <?php endif; ?>

                                        <?php if(!empty($records[$i]['pointOfContactOfData']['phone'])): ?>
                                            <?= JText::_('METADATA_PHONE') ?>: <span><?= ($records[$i]['pointOfContactOfData']['phone']); ?></span><br>
                                        <?php endif; ?>

                                        <?php if(!empty($records[$i]['pointOfContactOfData']['email']) and $records[$i]['pointOfContactOfData']['email']!='ND'): ?>
                                            <?= JText::_('METADATA_EMAIL') ?>: <span><a href="mailto:<?= ($records[$i]['pointOfContactOfData']['email']); ?>"><?= ($records[$i]['pointOfContactOfData']['email']); ?></a></span>
                                        <?php endif; ?>

                                    </div>
                                </div>
                            </div>
                            <hr class="sep-metadati">

                        <?php endif; ?>

                        <?php $links = $records[$i]['links']; ?>

                    </div>

                    <div class="col-md-3">
                        <div class="image-tematica">
                            <?php
                            $links = $records[$i]['links'];


                            foreach ($links as $value){
                                if ($value['type']=='thumbnail'){
                                    $href = str_replace(' ', '', $value['href']);
                                    ?>
                                    <a href="<?= $href ?>" data-lightbox="<?= $href ?>">
                                        <img src="<?php echo $href;?>" class="img-metadati" onerror="getErrorImage(this, '<?= $href ?>')" alt="<?= htmlspecialchars($records[$i]['title']) ?>" />
                                    </a>
                                    <?php
                                }else{
                                    ?>
                                    <img src="<?= $baseurls ?>images/icons/PlaceholderPhoto01.png" class="img-metadati" alt="No metadata image" />
                                    <?php
                                }

                                break;
                            }
                            ?>
                            <div class="lb-closeContainer"><a class="lb-close"></a></div>
                        </div>

                    </div>
                </div>

                <div class="row top20">
                    <div class="col-md-3">
                        <div class="btn-group full-width">
                            <button type="button" class="btn dropdown-toggle full-width bgrey" data-toggle="dropdown" aria-expanded="false">
                                <?= JText::_('DETAILS') ?> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu tematica-detail" role="menu">
                                <?php

                                //IL PREVIEW  E' DISABILITATO ($value['type'] == 'preview')

                                foreach ($links as $value) {
                                    if ($value['type'] =='details' ||$value['type'] == 'metadata'||$value['type'] == 'website') {
                                        if ($value['type'] == 'metadata') { ?>
                                            <li>
                                                <a href="<?php echo $value['href']?>" target="_blank">
                                                    <?php echo $arraybuttons[$value['type']]['key-'.$lang_code];?>
                                                </a>
                                            </li>

                                            <!-- MODIFICA geodcat-ap -->
                                            <li>

                                                <?php

												
												$id = $records[$i]['id'];
												
                                                $urlExt = str_replace("ID_REPLACE",urlencode($id),$config->get('GeoDCATAP_IT'));
												
                                                ?>
                                                <a href="<?php echo $urlExt;?>" target="_blank">
                                                    GeoDCAT-AP_IT
                                                </a>
                                            </li>
                                        <?php }elseif($value['type'] == 'website') { ?>

                                            <li><a href="<?php echo $value['href'];?>" target="_blank"><?php echo $arraybuttons[$value['type']]['key-'.$lang_code];?></a></li>

                                        <?php }elseif($value['type'] == 'details') { ?>

                                            <li>
                                                <form method="post" action="<?=JUri::base();?><?= JText::_('URL_METADATA_DETAILS') ?>">
                                                    <button type="submit" value="<?php echo $value['href'];?>" name="url_scheda_metadati">
                                                        <?php echo $arraybuttons[$value['type']]['key-'.$lang_code];?>
                                                    </button>
                                                </form>
                                            </li>

                                        <?php }
                                    }
                                } ?>
                            </ul>
                        </div>
                    </div>

                    <?php
                    $counter=0;
                    $disabled = 'disabled';
                    $items = $title = '';
                    foreach ($links as $value) {
                        if (
						$value['type'] =='open' ||
						($value['type'] == 'addToMap' && !(strpos($value['href'], 'resource=wfs') !== false) && !(strpos($value['href'], 'resource=wcs') !== false)&& !(strpos($value['href'], 'resource=wmts') !== false))||
						$value['type'] == 'agskml'||
						$value['type'] == 'agslyr'||
						$value['type'] == 'agsnmf'){
                            $items .= '<li><a href="'.$value['href'].'" target="_blank">'.$arraybuttons[$value['type']]['key-'.$lang_code].'</a></li>';

                            $disabled = '';
                            $counter++;
                        }
                    }
                    if($counter == 0)
                        $title = JText::_('NO_OPEN');
                    ?>
                    <div class="col-md-3">
                        <div class="btn-group full-width">
                            <button type="button" class="btn dropdown-toggle full-width bgrey <?= $disabled ?>" <?= $disabled ?> title="<?= $title ?>" data-toggle="dropdown" aria-expanded="false">
                                <?= JText::_('OPEN') ?> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu tematica-detail" role="menu">
                                <?= $items ?>
                            </ul>
                        </div>
                    </div>

                    <?php
                    $counter=0;
                    $disabled = 'disabled';
                    $items = $title = '';
                    foreach ($links as $value) {
                        if ($value['labelKey'] =='catalog.rest.wms' ||$value['labelKey'] == 'catalog.rest.wfs'||$value['labelKey'] == 'catalog.rest.wcs'||$value['labelKey'] == 'catalog.rest.wmts')
                        {
                            $items .= '<li><a href="' . $value['href'] . '" target="_blank">' . $arraybuttons[$value['labelKey']]['key-'.$lang_code] . '</a></li>';

                            $disabled = '';
                            $counter++;
                        }
                    }
                    if($counter == 0)
                        $title = JText::_('NO_OGC_SERVICES');
                    ?>
                    <div class="col-md-3">
                        <div class="btn-group full-width">
                            <button type="button" class="btn dropdown-toggle full-width bgrey <?= $disabled ?>" <?= $disabled ?> title="<?= $title ?>" data-toggle="dropdown" aria-expanded="false">
                                <?= JText::_('OGC_SERVICES') ?> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu tematica-detail" role="menu">
                                <?= $items ?>
                            </ul>
                        </div>
                    </div>

                    <?php
                    $counter=0;
                    $items = $title = '';
                    $disabled = 'disabled';
                    foreach ($links as $value) {
                        if ($value['labelKey'] =='catalog.rest.download') {

                            $items .= '<li><a href="'.$value['href'].'" target="_blank">'.$arraybuttons[$value['labelKey']]['key-'.$lang_code].'</a></li>';

                            $disabled = '';
                            $counter++;
                        }
                    }
                    if($counter == 0)
                        $title = JText::_('NODOWNLOAD');
                    ?>
                    <div class="col-md-3">
                        <div class="btn-group full-width">
                            <button type="button" class="btn dropdown-toggle full-width bgrey <?= $disabled ?>" <?= $disabled ?> title="<?= $title ?>" data-toggle="dropdown" aria-expanded="false">
                                <?= JText::_('DOWNLOAD') ?> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu tematica-detail" role="menu">
                                <?= $items ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <hr>

        <?php }

        $last_page = intval(($json['totalResults']/$num_paged)+1);

        $pagination_link = JUri::base() . JText::_('URL_METADATA')."?keyword=$keyword&paged=";
		

        if($last_page!=1) {?>
            <div class="pagination">
                <ul class="pagination-list">

                    <?php if($page_num>1){ ?>
                        <li>
                            <a title="<?= JText::_('PREVIOUS') ?>" href='<?= $pagination_link . ($page_num-1) ?>'>
                                <img src="<?php echo JUri::base();?>/templates/rndt/images/icons/Back.png" alt="<?= JText::_('PREVIOUS') ?>">
                            </a>
                        </li>
                    <?php } ?>

                    <?php for ($page = $page_num; $page <= $last_page; $page++) {

                        if($page>$page_num)
                        {
                            if($page<$last_page)
                                echo '<li><a class="noborder nocursor">...</a></li>';

                            $page = $last_page;
                        }

                        $active = ($page==$page_num) ? 'active bgreen' : '';

                        ?>
                        <li class="<?= $active ?>">
                            <a href='<?= $pagination_link . $page ?>'><?= $page ?></a>
                        </li>
                    <?php } ?>

                    <?php if($page_num+1<=$last_page){ ?>
                        <li>
                            <a title="<?= JText::_('NEXT') ?>" href='<?= $pagination_link . ($page_num+1) ?>'>
                                <img src="<?php echo JUri::base();?>/templates/rndt/images/icons/Next.png" alt="<?= JText::_('NEXT') ?>">
                            </a>
                        </li>
                    <?php } ?>

                    <?php if($page_num+10<=$last_page){ ?>
                        <li>
                            <a href="<?= $pagination_link . ($page_num+10) ?>">+10</a>
                        </li>
                    <?php } ?>
                </ul>
            </div>
        <?php }?>

        <?php
            $allItemsUrlClient = str_replace("&f=json", "", $allItemsUrlClient);
            $allItemsUrlClient = str_replace(GPT_REST_URL_SERVER, GPT_REST_URL, $allItemsUrlClient);
        ?>
        <p><?= JText::_('METADATA_SHOW') ?>
            <a target="_blank" class="green" href="<?= $allItemsUrlClient.'&f=html' ?>">HTML</a>,
            <a target="_blank" class="green" href="<?= $allItemsUrlClient.'&f=json' ?>">Json</a>,
            <a target="_blank" class="green" href="<?= $allItemsUrlClient.'&f=georss' ?>">GeoRSS</a>,
            <a target="_blank" class="green" href="<?= $allItemsUrlClient.'&f=atom' ?>">Atom</a>.
        </p>

    <?php } //if risultati ?>
</div>

<script>


	if(location.href.indexOf("&paged=") != -1){
		if(!sessionStorage.getItem("savedPageControl")){
			sessionStorage.setItem("savedPageControl",2);
		}else{
			var count = parseInt(sessionStorage.getItem("savedPageControl"))+1;
			sessionStorage.setItem("savedPageControl",count);
		
		}
	}else{
		sessionStorage.removeItem("savedPageControl");
	}
	
	function controlAndGo(){
		var control = !sessionStorage.getItem("savedPageControl") ? 1 : parseInt(sessionStorage.getItem("savedPageControl"));
		sessionStorage.removeItem("savedPageControl");
		window.history.go(-control);
	}




    var cookieDatiRicerca = "<?php echo str_replace ( '"' , '\"' , $datiRicerca );?>";
    var cookieDatiRicercaUrl = "<?php echo str_replace ( '"' , '\"' , $datiRicercaUrl );?>";

    function getErrorImage(img, url) {
        img.src='<?= $baseurls ?>images/icons/PlaceholderNoPhoto01.png';

        var a = jQuery(img).parent();

        a.removeAttr('data-lightbox href');
        a.css('cursor', 'auto');
        a.attr('title', url);
    }

    document.addEventListener('keydown', function(e) {
        if (jQuery('#lightbox-img').length==1 && e.keyCode===9) //Tab
            e.preventDefault();
    });



    /* Bug 130:
     * il problema si verifica quando si fa una ricerca avanzata con Profilo (ad esempio dati) ed un altro filtro.
     * Rimuovendo quest'ultimo dai risultati della ricerca, non viene "rispettato" il filtro Profilo impostato, ma vengono mostrati tutti i risultati.
     *
     * FIX:
     * Adattamento lettura dei dati: dai campi input/checkbox del Form alla serializzazione del Cookie
     * @author paolo martufi 2017/07/03
     */
    function adaptSerialize(se){
        var r,t,b,i,a,be,ct,o,ss;
        var selectionSearch, datiDataset, datiSeries; //aggiunti da paolo martufi 2017/07/03
        var Fskis = searchKeyInSerialize;

        //http://192.168.1.58:8080/geoportalRNDT/rest/index/stats
        //searchText
        var searchTextSup = [];
        r = Fskis(se, "filter-search");
        if(r) r+=":"; else r = "";
        t = Fskis(se, "text-free");
        ct = Fskis(se, "text-free-radio");
        if(ct == "text"){
            searchTextSup.push(t);
        }else{
            if(t && t != null){
                var controlSPlit = t.split(" ");
                if(controlSPlit.length == 1){
                    searchTextSup.push(r+replaceText(t,ct));
                }else{
                    searchTextSup.push(r+"("+replaceText(t,ct)+")");
                }
            }
        }

        r = Fskis(se, "keywords");
        if(r) searchTextSup.push('keywords:("'+removeSpace(r)+'")');
        r = Fskis(se, "inspireThemes");
        if(r) searchTextSup.push('INSPIRETheme:("'+removePlus(r)+'")');
        r = Fskis(se, "services");
        if(r) searchTextSup.push("services:"+r);

        r = Fskis(se, "admin-resp");
        if(r) searchTextSup.push("apiso.DataOrganizationName:"+r);

        r = Fskis(se, "specialist-date");
        a = Fskis(se, "data-da");//after
        be = Fskis(se, "data-a");//before
        if(r && a && be) searchTextSup.push(r+":["+a+" TO "+be+"]");


        //aggiunti da paolo martufi 2017/07/03
        selectionSearch = Fskis(se, "selection-search");
        datiDataset = Fskis(se, "dati_dataset");
        datiSeries = Fskis(se, "dati_series");

        if(selectionSearch == "dati"){
            var str = "";

            var countSearch = 0;
            if(datiDataset == "on"){
                countSearch++;
                str+= "apiso.Type:dataset";
            }
            if(datiSeries == "on"){
                if(countSearch == 1) str+=" OR ";
                str+= "apiso.Type:series";
            }

            str = "("+str+")";
            searchTextSup.push(str);
        }else if (selectionSearch == "servizi"){
            searchTextSup.push("(apiso.Type:service)");
        }

        //bbox
        b = Fskis(se, "extent");

        //spatialRel
        ss = Fskis(se, "spatialRel");

        //dataCategory
        i = Fskis(se, "tema-iso");


        var compositeStr = [];

        if(searchTextSup.length != 0){
            var sm = searchTextSup.length != 1 ? "'" : "";
            compositeStr.push("searchText="+sm+searchTextSup.join(" AND ")+sm+"");
        }

        if(b){
            compositeStr.push('bbox='+removePlus(b));
            //compositeStr.push('bboxSR='+window.functionMap.map.spatialReference.wkid);
        }

        if(i) compositeStr.push('dataCategory='+i);

        //if(a) compositeStr.push('after='+a);
        //if(be) compositeStr.push('before='+be);

        //before
        o = Fskis(se, "order");
        if(o) compositeStr.push('orderBy='+o);
        if(ss) compositeStr.push('spatialRel='+ss);

        return compositeStr.length != 0? compositeStr.join("&") : null;
    }

    function searchKeyInSerialize(serialize, keySearc) {
        var arraySup = serialize.split("&");

        var found = null;
        jQuery.each(arraySup, function (i, item) {
            var supValue = item.split("=");
            var key = supValue[0];
            var value = supValue[1];
            if(value && value != -1 && keySearc == key){
                found = decodeURIComponent(value);
            }
        });
        return found;
    }

    function createCookie(name,value,days) {
        var expires = "";
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days*24*60*60*1000));
            expires = "; expires=" + date.toUTCString();
        }
        document.cookie = name + "=" + value + expires + "; path=/";
    }

    function readCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for(var i=0;i < ca.length;i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1,c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
        }
        return null;
    }

    function replaceText(text,control) {
        if(control == "all"){
            return text;
        }else{//control == "one"
            return removePlus(text);
        }

    }

    function escapeRegExp(str) {
        return str.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
    }

    function replaceAll(str, find, replace) {
        return str.replace(new RegExp(escapeRegExp(find), 'g'), replace);
    }

    function removePlus(str) {
        return str.replace(new RegExp(escapeRegExp('+'), 'g'), ' ');
    }

    function removeSpace(str) {
        return str.replace(new RegExp(escapeRegExp(' '), 'g'), '+');
    }

    function generateDefineUrl(urlGeoportal,params) {

        var count = 1;
        for(var item in params){
            urlGeoportal += count++ <= 1 ? "?" : "&";
            urlGeoportal += item + "=" + params[item];
        }
        return urlGeoportal;
    }

    /*
     * deserializza i dati (parametri encodati in "&") di una stringa, in queso caso un cookie
     * e rimuove tutti quelli relativi alla chiave del filtro indicata
     * @author paolo martufi 2017-06-27
     */
    function removeFilterFromCookie(cookie, filterKey) {
        if(cookie == "" || filterKey == "")
            return cookie;
        var cleanedCookie = new Array();
        var splittedCookie = cookie.split("&");
        for (var param in splittedCookie)
            if(!getKeyFromEcondedParam(splittedCookie[param]).includes(filterKey)) //uso "includes" al posto dell'operatore "!=" per il caso di inspireThemes-checkbox e inspireThemes che vanno esclusi simultaneamente
                cleanedCookie.push(splittedCookie[param]);
        return cleanedCookie.join("&");
    }

    /*
     * restituisce la parte sinistra di una stringa separata dal simbolo "="
     * @author paolo martufi 2017-06-27
     */
    function getKeyFromEcondedParam(param) {
        return param.split("=")[0];
    }


    jQuery('.remove_filter').click(function() {

        var elem = this.attributes['data-filter'].value;

        var other = null;
        var other2 = null;

        if(elem.indexOf("apiso.Type") != -1){
            if(elem.indexOf("apiso.Type:service") != -1){
                other = "apiso.ServiceType";
            }else{
                other = "INSPIRETheme";
                other2 = "dataCategory";
            }
        }

        var cookie1 = JSON.parse(readCookie('saveObjSearchText'));
        var cookie2 = JSON.parse(readCookie('saveCompositeStr'));

        var arrayNew = {};
        for(var item in cookie1){
            if(cookie1[item] != elem && cookie1[item].indexOf(other) == -1 && cookie1[item].indexOf(other2) == -1){
                eval("arrayNew."+item+" = cookie1[item]");
            }
        }

        createCookie('saveObjSearchText',JSON.stringify(arrayNew));

        var arrayNew2 = {};
        for(var item2 in cookie2){
            if(cookie2[item2] != elem && cookie2[item2].indexOf(other) == -1 && cookie2[item2].indexOf(other2) == -1){
                eval("arrayNew2."+item2+" = cookie2[item2]");
            }
        }

        createCookie('saveCompositeStr',JSON.stringify(arrayNew2));

        //this.attributes['data-filter'];
        //data-filter

        /*
         var filter = jQuery(this).data('filter');
         var cookie1 = readCookie('saveObjSearchText');
         var cookie2 = readCookie('saveCompositeStr');
         if(!cookie) cookie = cookieDatiRicerca;
         if(cookie) {
         /* Bug 130, Bug 142:
         * 1) l'azione cookie.replace(filter, '') non è sufficiente a rimuovere dal cookie tutte le informazioni che vanno rimosse
         * 2) la variabile "adapt" non è dichiarata

         cookie = cookie.replace(filter, '');
         createCookie('datiRicerca',adapt); //bug: adapt non dichiarato
         */

        /* Fix:
         * 1) rimuove dal cookie tutti i parametri encodati che hanno come chiave quella del filtro
         * 2) crea il cookie "datiRicerca" correttamente
         * @author paolo martufi 2017-06-27
         */
        /*
         var filterKey = getKeyFromEcondedParam(filter);
         filterKey = filterKey == "inspireThemes-checkbox" ? "inspireThemes" : filterKey; // necessario per rimuovere simultaneamente i valori aventi chiavi "inspireThemes-checkbox" e "inspireThemes"
         cookie = removeFilterFromCookie(cookie, filterKey);
         createCookie('datiRicerca',cookie);*/


        //}

        /*
         var params = {
         start: 1,

         geometryType: "esriGeometryBox"
         };

         var adapt = adaptSerialize(cookie);
         adapt = adapt ? "&" + adapt : "";


         if(!paramsCrip) paramsCrip = cookieDatiRicercaUrl;
         if(paramsCrip) paramsCrip = paramsCrip.replace(filter, '');
         if(paramsCrip) createCookie('datiRicercaUrl',paramsCrip);*/

        location.href = location.origin + location.pathname;
    });

</script>
