<?php

defined('JPATH_BASE') or die;

$app = JFactory::getApplication();
$config = JFactory::getConfig();

$lang = JFactory::getLanguage();
$lang_code = substr($lang->getTag(), 0,2);


$juser = JFactory::getUser();
$jusername = $juser->username;
$groups = $juser->groups;

// 7=Administrator;	8=Super User
global $is_admin;
$is_admin = (in_array(7, $groups) or in_array(8, $groups)) ? true : false;

$webapp = $is_admin ? $config->get('gpt_admin') : $config->get('gpt_public');

/************** Geoportal URLs defines **************/
// Vedo se la variabile dche definisce il protocollo di chiamat ae' ettata, se lo e'
// uso quel valore per le chiamate al GPT altrimenti prendo il default dalla variabile
// di configurazione gpt_client_protocol

if(!empty($_SERVER['X-Forwarded-Proto']))
	define('GPT_FORCE_PROTOCOL', $_SERVER['X-Forwarded-Proto']);
else
	define('GPT_FORCE_PROTOCOL', $config->get('gpt_client_protocol'));



$baseUrl = JURI::root();
$baseUrl = strpos($baseUrl, 'https') !== false ? str_replace("https",GENERIC_FORCE_PROTOCOL,$baseUrl): str_replace("http",GENERIC_FORCE_PROTOCOL,$baseUrl);


define('BASE_URL_PROTO', $baseUrl);

$baseUrl  = BASE_URL_PROTO;

$baseurls = $baseUrl.'templates/'.$app->getTemplate().'/';

define('BASE_URL',				GPT_FORCE_PROTOCOL . '://' . $config->get('gpt_client_host'));
// define('BASE_URL_GPT',			BASE_URL . ':' . $config->get('gpt_port_client') . '/');
if (!empty($config->get('gpt_port_client')))
	define('BASE_URL_GPT',			BASE_URL . ':' . $config->get('gpt_port_client') . '/');
else
	define('BASE_URL_GPT',			BASE_URL . '/');

define('GPT_BASE_URL',			BASE_URL_GPT . $webapp);
define('GPT_REST_URL',			GPT_BASE_URL . $config->get('gpt_document_path'));

//server
define('BASE_URL_SERVER',		$config->get('gpt_server_protocol') . '://' . $config->get('gpt_server_host'));
define('GPT_BASE_URL_SERVER',	BASE_URL_SERVER . ':' . $config->get('gpt_port_server') . '/' . $webapp);
define('GPT_REST_URL_SERVER',	GPT_BASE_URL_SERVER . $config->get('gpt_document_path'));
define('GPT_THEMES_URL',		GPT_BASE_URL_SERVER . $config->get('gpt_themes_path'));



global $text;
$text =
	[
		'home.inspire_cluster'	=>
		[
			'thematicClusters' =>
			[
				['name'	=> 'env',	'it'	=> 'Monitoraggio e Osservazioni ambientali',	'en'	=> 'Environmental Monitoring and Observations Cluster',				'children'	=> ['ef']],
				['name'	=> 'transp','it'	=> 'Dati di base topografici e catastali ',	'en'	=> 'Topographic and Cadastral Reference Data',						'children'	=> ['hy','gn','au','cp','ad','bu','tn']],
				['name'	=> 'land',	'it'	=> 'Copertura del suolo e Utilizzo del Territorio',	'en'	=> 'Land Cover and Land Use Cluster',								'children'	=> ['lu','lc']],
				['name'	=> 'ele',	'it'	=> 'Elevazione, Orto immagini, Sistemi di Riferimento, Griglie geografiche',	'en'	=> 'Elevation, Orthoimagery, Reference Systems, Geographical Grids','children'	=> ['el','oi','rs','gg']],
				['name'	=> 'geo',	'it'	=> 'Scienze della Terra',	'en'	=> 'Earth Science Cluster',											'children'	=> ['ge','so','nz','mr','er']],
				['name'	=> 'faci',	'it'	=> 'Impianti e Servizi di pubblica utilità ',	'en'	=> 'Facilities, Utilities and Public Services',						'children'	=> ['pf','af','us']],
				['name'	=> 'mari',	'it'	=> 'Mare e Atmosfera',	'en'	=> 'Marine and Atmosphere Cluster',									'children'	=> ['of','sr','ac','mf']],
				['name'	=> 'bio',	'it'	=> 'Biodiversità e Aree sottoposte a gestione',	'en'	=> 'Biodiversity and Management Areas Cluster',						'children'	=> ['ps','br','hb','sd','am']],
				['name'	=> 'stat',	'it'	=> 'Statistica',	'en'	=> 'Statistical Cluster',											'children'	=> ['su','pd','hh']]
			],
			'priorityDataset' =>
			[
				['name'	=> 'dataset-ari',	'it'=> 'Aria e rumore',				'en'	=> 'Air & Noise', 			'keywords' => [
                    'Directive 2008/50/EC',
                    'Management zones and agglomerations (Air Quality Directive)',
                    'Agglomerations (Air Quality Directive)',
                    'Management zones (Air Quality Directive)',
                    'Model areas (Air Quality Directive)',
                    'Monitoring stations (Air Quality Directive)',
                    'Measurement and modelling data (Air Quality Directive)',

                    'Directive 2002/49/EC',
                    'Major roads, railways and air transport network (Noise Directive)',
                    'Major roads (Noise Directive)',
                    'Major roads, railways and air transport network (Noise Directive)',
                    'Major railways (Noise Directive)',
                    'Major roads, railways and air transport network (Noise Directive)',
                    'Major air transport (Noise Directive)',
                    'Agglomerations (Noise Directive)',
                    'Population (Noise Directive)',
                    'Environmental noise exposure (Noise Directive)',
                    'Population - densely populated built-up areas (Noise Directive)',
                    'Major roads noise exposure delineation (Noise Directive)',
                    'Major railways noise exposure delineation (Noise Directive)',
                    'Agglomerations - roads noise exposure delineation (Noise Directive)',
                    'Agglomerations - railways noise exposure delineation (Noise Directive)',
                    'Agglomerations - aircraft noise exposure delineation (Noise Directive)',
                    'Agglomerations - industrial noise exposure delineation (Noise Directive)',
                    'Agglomerations - noise exposure delineation (Noise Directive)',
                    'Major roads noise exposure delineation day-evening-night (Noise Directive)',
                    'Major roads noise exposure delineation - night (Noise Directive)',
                    'Major railways noise exposure delineation day-evening-night (Noise Directive)',
                    'Major railways noise exposure delineation - night (Noise Directive)',
                    'Major airports noise exposure delineation day-evening-night (Noise Directive)',
                    'Major airports noise exposure delineation - night (Noise Directive)',
                    'Agglomerations - roads noise exposure delineation day-evening-night (Noise Directive)',
                    'Agglomerations - roads noise exposure delineation - night (Noise Directive)',
                    'Agglomerations - railways noise exposure delineation day-evening-night (Noise Directive)',
                    'Agglomerations - railways noise exposure delineation - night (Noise Directive)',
                    'Agglomerations - aircraft noise exposure delineation day-evening-night (Noise Directive)',
                    'Agglomerations - aircraft noise exposure delineation - night (Noise Directive)',
                    'Agglomerations - industrial noise exposure delineation day-evening-night (Noise Directive)',
                    'Agglomerations - industrial noise exposure delineation - night (Noise Directive)',
                    'Agglomerations - noise exposure delineation day-evening-night (Noise Directive)',
                    'Agglomerations - noise exposure delineation - night (Noise Directive)'
                ]],
				['name'	=> 'dataset-ind',	'it'=> 'Industria',					'en'	=> 'Industry', 				'keywords' => [
                    'Regulation (EC) 166/2006',
                    'Industrial sites - EU Registry (European Pollutant Release and Transfer Register)',
                    'Sites and facilities (European Pollutant Release and Transfer Register)',
                    'Actual pollutant releases (European Pollutant Release and Transfer Register)',
                    'Directive 2010/75/EU',
                    'Industrial sites - EU Registry (Industrial Emissions Directive)',
                    'Installations (Industrial Emissions Directive)',
                    'Directive 2010/75/EU',
                    'Industrial sites - EU Registry (Industrial Emissions Directive)',
                    'Large combustion plants (Industrial Emissions Directive)',
                    'Directive 2010/75/EU',
                    'Emissions (Industrial Emissions Directive)',
                    'Recommendation 2014/70/EU',
                    'Boreholes (Recommendation on hydraulic fracturing)',
                    'Boreholes for hydraulic fracturing (Recommendation on hydraulic fracturing)',
                    'Directive 2012/18/EU',
                    'Establishments  involving dangerous substances (SEVESO III Directive)'

                ]],
				['name'	=> 'dataset-rif',	'it'=> 'Rifiuti',					'en'	=> 'Waste', 				'keywords' => [
                    'Directive 1999/31/EC',
                    'Exempted islands and isolated settlements (Landfill of Waste Directive)',
                    'Landfill of waste sites (Landfill of Waste Directive)',
                    'Directive 2006/21/EC',
                    'Facilities for managing extractive waste (Extractive Waste Directive)',
                    'Agricultural facilities receiving sludge (Sewage Sludge Directive)',
                    'Directive 86/278/EEC',
                    'Agricultural sites where sludge is deposited (Sewage Sludge Directive)',
                    'Regulation (EU) 2017/852',
                    'Mercury storage facilities (Mercury Regulation)'
                ]],
				['name'	=> 'dataset-nat',	'it'=> 'Natura e biodiversità',		'en'	=> 'Nature & Biodiversity', 'keywords' => [
                    'Directive 92/43/EEC',
                    'National legislation',
                    'Directive 92/43/EEC',
                    'Directive 2009/147/EC',
                    'Regulation (EU) 1143/2014',
                    'EEA Annual Work Programme',
                    'Pan-European biogeographical regions (Habitats Directive)',
                    'National biogeographical regions',
                    'Habitat types and species distribution and range (Habitats Directive)',
                    'Natura 2000 sites (Habitats Directive)',
                    'Pan-European biogeographical regions (Birds Directive)',
                    'National biogeographical regions',
                    'Bird species distribution and range (Birds Directive)',
                    'Natura 2000 sites (Birds Directive)',
                    'Invasive alien species distribution (Invasive Alien Species Directive)',
                    'Nationally designated areas - CDDA',
                    'National biogeographical regions (Habitats Directive)',
                    'Habitat types distribution (Habitats Directive)',
                    'Habitat types range (Habitats Directive)',
                    'Species distribution (Habitats Directive)',
                    'Species range (Habitats Directive)',
                    'National biogeographical regions (Birds Directive)',
                    'Bird species distribution (Birds Directive)',
                    'Birds range (Birds Directive)',
                    'Habitat types distribution - sensitive (Habitats Directive)',
                    'Species distribution sensitive (Habitats Directive)',
                    'Bird species distribution - sensitive (Birds Directive)',
                    'Birds range - sensitive (Birds Directive)'
                ]],
				['name'	=> 'dataset-acq',	'it'=> 'Acqua',						'en'	=> 'Water', 				'keywords' => [
                    'Directive 98/83/EC',
                    'Directive 2006/7/EC',
                    'Directive 91/271/EEC',
                    'Drinking water supply zones (Drinking Water Directive)',
                    'Drinking water abstraction points (Drinking Water Directive)',
                    'Bathing water sites  (Bathing Water Directive)',
                    'Agglomerations (Urban Waste Water Treatment Directive)',
                    'Urban waste-water treatment plants (Urban Waste Water Treatment Directive)',
                    'Discharge points to receiving waters (Urban Waste Water Treatment Directive)',
                    'Sensitive areas, less sensitive areas and catchments (Urban Waste-Water Treatment Directive)',
                    'Monitoring stations (Nitrates Directive)',
                    'Nitrates vulnerable zones (Nitrates Directive)',
                    'Large water supply zones (Drinking Water Directive)',
                    'Small water supply zones (Drinking Water Directive)',
                    'Sensitive areas (Urban Waste-Water Treatment Directive)',
                    'Less sensitive areas (Urban Waste-Water Treatment Directive)',
                    'Sensitive area catchments (Urban Waste-Water Treatment Directive)',
                    'Directive 2000/60/EC',
                    'Directive 2007/60/EC',
                    'River basin districts (Water Framework Directive)',
                    'River basin districts sub-units (Water Framework Directive)',
                    'Water bodies (Water Framework Directive)',
                    'Protected areas (Water Framework Directive)',
                    'Monitoring stations (Water Framework Directive)',
                    'Areas of Potential significant flood risk (Floods Directive)',
                    'Preliminary flood risk assessment (Floods Directive)',
                    'Flooded areas (Floods Directive)',
                    'Flood risk zones (Floods Directive)',
                    'Management units (Floods Directive)',
                    'Surface water bodies (Water Framework Directive)',
                    'Groundwater bodies (Water Framework Directive)',
                    'Nitrate vulnerable zones - nutrient sensitive areas (Water Framework Directive)',
                    'Urban waste water sensitive areas - nutrient sensitive areas (Water Framework Directive)',
                    'Bathing waters - recreational waters (Water Framework Directive)',
                    'Drinking water protection areas (Water Framework Directive)',
                    'Water dependent Natura 2000 sites (Water Framework Directive)',
                    'Designated waters (Water Framework Directive)',
                    'Preliminary flood risk assessment - observed events (Floods Directive)',
                    'Preliminary flood risk assessment - potential future events (Floods Directive)',
                    'Flood hazard areas low probability scenario (Floods Directive)',
                    'Flood hazard areas medium probability scenario (Floods Directive)',
                    'Flood hazard areas high probability scenario (Floods Directive)',
                    'Flood risk zones low probability scenario (Floods Directive)',
                    'Flood risk zones medium probability scenario (Floods Directive)',
                    'Flood risk zones high probability scenario (Floods Directive)',
                    'Lakes (Water Framework Directive)',
                    'Rivers (Water Framework Directive)',
                    'Transitional waters (Water Framework Directive)',
                    'Coastal waters (Water Framework Directive)',
                    'Protection of economically significant aquatic species - shellfish designated waters (Water Framework Directive)',
                    'Protection of economically significant aquatic species - freshwater fish designated waters (Water Framework Directive)',
                    'Other protected areas (Water Framework Directive)'
                ]],
				['name'	=> 'dataset-mar',	'it'=> 'Marina',					'en'	=> 'Marine', 				'keywords' => [
                    'Directive 2008/56/EC',
                    'Marine regions and units (Marine Strategy Framework Directive)',
                    'Marine assessment units (Marine Strategy Framework Directive)',
                    'Marine regions (Marine Strategy Framework Directive)',
                    'Marine reporting units (Marine Strategy Framework Directive)',
                    'Marine sub-regions (Marine Strategy Framework Directive)'
                ]]
			],
			'openData' =>
			[
				['name'	=> 'opendata-agr',	'it'=> 'Agricoltura, pesca, silvicoltura e prodotti alimentari', 'en'	=> 'Agriculture, fisheries, forestry and food',          'keywords' => [
				    'Impianti agricoli e di acquacoltura'
                ]],
                ['name'	=> 'opendata-amb',	'it'=> 'Ambiente',				                                  'en'	=> 'Environment', 		 	                              'keywords' => [
                    'Condizioni atmosferiche',
                    'Copertura del suolo',
                    'Distribuzione delle specie',
                    'Elementi geografici meteorologici',
                    'Elementi geografici oceanografici',
                    'Habitat e biotopi', 'Idrografia',
                    'Impianti di monitoraggio ambientale',
                    'Regioni biogeografiche',
                    'Regioni marine',
                    'Risorse minerarie',
                    'Siti protetti',
                    'Suolo',
                    'Utilizzo del territorio',
                    'Zone a rischio naturale',
                    'Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati'
                ]],
				['name'	=> 'opendata-eco',	'it'=> 'Economia',				                                  'en'	=> 'Economy', 		 	                                  'keywords' => [
				    'Parcelle catastali',
                    'Produzione e impianti industriali',
                    'Risorse minerarie',
                    'Utilizzo del territorio'
                ]],
				['name'	=> 'opendata-gov',	'it'=> 'Governo e settore pubblico',                             'en'	=> 'Government and public sector', 		 	              'keywords' => [
				    'Servizi di pubblica utilità e servizi amministrativi','Unità amministrative'
                ]],
				['name'	=> 'opendata-pop',	'it'=> 'Popolazione e società',				                      'en'	=> 'Population and society', 		 	                  'keywords' => [
				    'Distribuzione della popolazione — demografia',
                    'Unità statistiche']],
				['name'	=> 'opendata-reg',	'it'=> 'Regioni e città',                                        'en'	=> 'Regions and cities', 		 	                      'keywords' => [
				    'Edifici', 'Elevazione',
                    'Geologia', 'Indirizzi',
                    'Nomi geografici',
                    'Ortoimmagini',
                    'Parcelle catastali',
                    'Sistemi di coordinate',
                    'Sistemi di griglie geografiche'
                ]],
				['name'	=> 'opendata-sal',	'it'=> 'Salute',                                                 'en'	=> 'Health', 		 	                                  'keywords' => [
				    'Salute umana e sicurezza'
                ]],
				['name'	=> 'opendata-sci',	'it'=> 'Scienza e tecnologia',				                      'en'	=> 'Science and technology', 		 	                   'keywords' => [
				    'Elementi geografici meteorologici',
                    'Geologia',
                    'Idrografia',
                    'Ortoimmagini'
                ]],
				['name'	=> 'opendata-tra',	'it'=> 'Trasporti',				                                  'en'	=> 'Transportation', 		 	                           'keywords' => [
				    'Reti di trasporto'
                ]]
			],
			'advancedSearchServices' =>
			[
				'discovery-it' => 'Servizio di ricerca',
				'view-it' => 'Servizio di consultazione',
				'download-it' => 'Servizio di scaricamento',
				'transformation-it' => 'Servizio di conversione',
				'invoke-it' => 'Servizio di richiesta servizi',
				'other-it' => 'Altri servizi',
				
				'discovery-en' => 'Servizio di ricerca',
				'view-en' => 'Servizio di consultazione',
				'download-en' => 'Servizio di scaricamento',
				'transformation-en' => 'Servizio di conversione',
				'invoke-en' => 'Servizio di richiesta servizi',
				'other-en' => 'Altri servizi'
			],
			'advancedSearchCategory' =>
			[
				'farming-it' => 'Agricoltura',
				'biota-it' => 'Biota',
				'boundaries-it' => 'Confini',
				'climatologyMeteorologyAtmosphere-it' => 'Climatologia - Metereologia - Atmosfera',
				'economy-it' => 'Economia',
				'elevation-it' => 'Elevazione',
				'environment-it' => 'Ambiente',
				'geoscientificInformation-it' => 'Informazioni geoscientifiche',
				'health-it' => 'Salute',
				'imageryBaseMapsEarthCover-it' => 'Mappe di base - Immagini - Copertura terrestre',
				'intelligenceMilitary-it' => 'Intelligence - Settore militare',
				'inlandWaters-it' => 'Acque interne',
				'location-it' => 'Localizzazione',
				'oceans-it' => 'Acque marine - Oceani',
				'planningCadastre-it' => 'Pianificazione - Catasto',
				'society-it' => 'Società',
				'structure-it' => 'Strutture',
				'transportation-it' => 'Trasporti',
				'utilitiesCommunication-it' => 'Servizi di pubblica utilità - Comunicazione',
				
				'farming-en' => 'Agricoltura',
				'biota-en' => 'Biota',
				'boundaries-en' => 'Confini',
				'climatologyMeteorologyAtmosphere-en' => 'Climatologia - Metereologia - Amosfera',
				'economy-en' => 'Economia',
				'elevation-en' => 'Elevazione',
				'environment-en' => 'Ambiente',
				'geoscientificInformation-en' => 'Informazioni geoscientifiche',
				'health-en' => 'Salute',
				'imageryBaseMapsEarthCover-en' => 'Mappe di base - Immagini - Copertura terrestre',
				'intelligenceMilitary-en' => 'Intelligence - Settore militare',
				'inlandWaters-en' => 'Acque interne',
				'location-en' => 'Localizzazione',
				'oceans-en' => 'Acque marine - Oceani',
				'planningCadastre-en' => 'Pianificazione - Catasto',
				'society-en' => 'Società',
				'structure-en' => 'Strutture',
				'transportation-en' => 'Trasporti',
				'utilitiesCommunication-en' => 'Servizi di pubblica utilità - Comunicazione'
			],
			'inspireThemes' => 
			[
				'rs-it'	=>	'Sistemi di coordinate',
				'el-it'	=>	'Elevazione',
				'lc-it'	=>	'Copertura del suolo',
				'oi-it'	=>	'Orto immagini',
				'ge-it'	=>	'Geologia',
				'su-it'	=>	'Unità statistiche',
				'bu-it'	=>	'Edifici',
				'so-it'	=>	'Suolo',
				'lu-it'	=>	'Utilizzo del territorio',
				'hh-it'	=>	'Salute umana e sicurezza',
				'us-it'	=>	'Servizi di pubblica utilità e servizi amministrativi',
				'gg-it'	=>	'Sistemi di griglie geografiche',
				'ef-it'	=>	'Impianti di monitoraggio ambientale',
				'pf-it'	=>	'Produzione e impianti industriali',
				'af-it'	=>	'Impianti agricoli e di acquacoltura',
				'pd-it'	=>	'Distribuzione della popolazione - demografia',
				'am-it'	=>	'Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati',
				'nz-it'	=>	'Zone a rischio naturale',
				'ac-it'	=>	'Condizioni atmosferiche',
				'mf-it'	=>	'Elementi geografici meteorologici',
				'of-it'	=>	'Elementi geografici oceanografici',
				'sr-it'	=>	'Regioni marine',
				'gn-it'	=>	'Nomi geografici',
				'br-it'	=>	'Regioni biogeografiche',
				'hb-it'	=>	'Habitat e biotopi',
				'sd-it'	=>	'Distribuzione delle specie',
				'er-it'	=>	'Risorse energetiche',
				'mr-it'	=>	'Risorse minerarie',
				'au-it'	=>	'Unità amministrative',
				'ad-it'	=>	'Indirizzi',
				'cp-it'	=>	'Parcelle catastali',
				'tn-it'	=>	'Reti di trasporto',
				'hy-it'	=>	'Idrografia',
				'ps-it'	=>	'Siti protetti',
				
				'ac-en'	=>	'Atmospheric conditions',
				'ad-en'	=>	'Addresses',
				'af-en'	=>	'Agricultural and aquaculture facilities',
				'am-en'	=>	'Area management/restriction/regulation zones and reporting units',
				'au-en'	=>	'Administrative units',
				'br-en'	=>	'Bio-geographical regions',
				'bu-en'	=>	'Buildings',
				'cp-en'	=>	'Cadastral parcels',
				'ef-en'	=>	'Environmental monitoring facilities',
				'el-en'	=>	'Elevation',
				'er-en'	=>	'Energy resources',
				'ge-en'	=>	'Geology',
				'gg-en'	=>	'Geographical grid systems',
				'gn-en'	=>	'Geographical names',
				'hb-en'	=>	'Habitats and biotopes',
				'hh-en'	=>	'Human health and safety',
				'hy-en'	=>	'Hydrography',
				'lc-en'	=>	'Land cover',
				'lu-en'	=>	'Land use',
				'mf-en'	=>	'Meteorological geographical features',
				'mr-en'	=>	'Mineral resources',
				'nz-en'	=>	'Natural risk zones',
				'of-en'	=>	'Oceanographic geographical features',
				'oi-en'	=>	'Orthoimagery',
				'pd-en'	=>	'Population distribution – demography',
				'pf-en'	=>	'Production and industrial facilities',
				'ps-en'	=>	'Protected sites',
				'rs-en'	=>	'Coordinate reference systems',
				'sd-en'	=>	'Species distribution',
				'so-en'	=>	'Soil',
				'sr-en'	=>	'Sea regions',
				'su-en'	=>	'Statistical units',
				'tn-en'	=>	'Transport networks',
				'us-en'	=>	'Utility and governmental services'
			],
			'metadataButtons' =>
			[
				'details'			=>	['key-it'=>'Scheda Metadati ',			'key-en'=>'Metadata '],
				'metadata'			=>	['key-it'=>'Metadati-XML',				'key-en'=>'XML-Metadata'],
				'website'			=>	['key-it'=>'Sito Web',					'key-en'=>'Website '],
				'preview'			=>	['key-it'=>'Anteprima',					'key-en'=>'Preview '],
				'open'				=>	['key-it'=>'Esplora ',					'key-en'=>'Explore '],
				'addToMap'			=>	['key-it'=>'Apri nel Viewer ',			'key-en'=>'Add To Map '],
				'agskml'			=>	['key-it'=>'Globo (.kml]',				'key-en'=>'Globe (.kml]'],
				'agsnmf'			=>	['key-it'=>'Globo (.nmf]',				'key-en'=>'Globe (.nmf]'],
				'agslyr'			=>	['key-it'=>'Desktop GIS','key-en'=>		'Desktop GIS (.lyr]'],
				'catalog.rest.wms'	=>	['key-it'=>'Servizio WMS',				'key-en'=>'WMS'],
				'catalog.rest.wfs'	=>	['key-it'=>'Servizio WFS',				'key-en'=>'WFS'],
				'catalog.rest.wcs'	=>	['key-it'=>'Servizio WCS',				'key-en'=>'WCS'],
				'catalog.rest.wmts'	=>	['key-it'=>'Servizio WMTS',				'key-en'=>'WMTS'],
				'catalog.rest.download'	=>	['key-it'=>'Servizio di Download',	'key-en'=>'Download']
			],
			'metadataFilters' =>
			[
				'it'	=>
				[
					'Profilo'		=>	'selection-search',
					'Testo libero'	=>	'text-free',
					'Dataset prioritari'   	=> 'tema_pdataset-checkbox-prioritydataset',
					'Temi open data'     	=> 'tema_pdataset-checkbox-opendata',
					'Open Data'     		=> 'OpenData',
					'Tema INSPIRE'	=>	'inspireThemes,inspireThemes-checkbox',
					'Tipo Servizio'	=>	'services,services-checkbox',
					'Parola chiave'	=>	'keywords',
					'Dove'			=>	'extent',
					'Categoria ISO'	=>	'tema-iso',
					'Responsabile'	=>	'admin-resp',
					'Quando'		=>	'data-da,data-a'
					/*'Ordinamento'	=>	'order'*/
				],
				'en'	=>
				[
					'Profile'		=>	'selection-search',
					'Anytext'		=>	'text-free',
					'Priority dataset'   	=> 'tema_pdataset-checkbox-prioritydataset',
					'Open data Theme'     	=> 'tema_pdataset-checkbox-opendata',
					'Open Data'     		=> 'OpenData',
					'INSPIRE Theme'	=>	'inspireThemes,inspireThemes-checkbox',
					'Service type'	=>	'services,services-checkbox',
					'Keyword'		=>	'keywords',
					'Where'			=>	'extent',
					'Topic category'=>	'tema-iso',
					'Responsible'	=>	'admin-resp',
					'When'			=>	'data-da,data-a'
					/*'Order'			=>	'order'*/
				]
			]
		]
	];

function get_article($id=0)
{
	if(!$id)
	{
		$input = JFactory::getApplication()->input;
		$id = $input->getInt('id');
	}
	
	$article = JTable::getInstance('content');
	$article->load($id);
	
	return $article;
}

function get_text($layout)
{
	
	global $text;
	if(isset($text[$layout]))
	{
		return $text[$layout];
	}
}

function getContent($layout)
{
	$text = get_text($layout);

	$content = new JLayoutFile("joomla.content.$layout");

	return $content->render($text);
}

function isAscii($str) {
    return mb_check_encoding($str, 'ASCII');
}
function writeLog($stringa){
	$myfile = file_put_contents('logs.txt', $stringa.PHP_EOL , FILE_APPEND | LOCK_EX);
}
function encodeUrl($url)
{
	$encodedUrl = '';
    for ($i=0; $i<strlen($url); $i++)
        if(isAscii($url[$i]))
			$encodedUrl .= $url[$i];
		else
			$encodedUrl .= urlencode($url[$i]);
		
	return $encodedUrl;
}

function get_field($article, $fieldName, $value='value')
{
	if(!$article || !$fieldName)
		return;
	
	$fields = FieldsHelper::getFields('com_content.article', $article, true);
	
	foreach ($fields as $field)
		if(isset($field->name) && $field->name==$fieldName)
			return isset($field->$value) ? $field->$value : "";
}

function get_field_list($field)
{
	$output=[];
	$query = "SELECT fieldparams FROM #__fields WHERE name='$field' AND state=1";
	$db = JFactory::getDBO();
	$db->setQuery($query);
	
	if(!$res=$db->loadObject())
		return $output;
	
	$fields = json_decode($res->fieldparams)->options;
	
	foreach($fields as $field)
		$output[$field->name] = $field->value;
	
	return $output;
}

function getArticleId($alias)
{
	if(!$alias)
		return;
	
	$query = "SELECT id FROM #__content WHERE alias='$alias'";
	$db = JFactory::getDBO();
	$db->setQuery($query);
	
	if(!$res=$db->loadObject())
		return;
	
	return $res->id;
}

function getGuideurl(){
	if(!$article = get_article()) return;

    $juser = JFactory::getUser();
    $groups = $juser->groups;
    $is_admin_control = (in_array(7, $groups) or in_array(8, $groups)) ? true : false;

	$page = 0;
	if($is_admin_control) {

		$url = get_field_list('link-guida')['Amministratore'];
		$page = get_field($article, 'pagina-guida-adm');
		// Se non trovo la pagina vedo se c'è nella guida pubblica altrimenti uso sempre la guida Admin
		if(!$page) {
			$page = get_field($article, 'pagina-guida-public');
			if ($page) {
				$url = get_field_list('link-guida')['Pubblica'];
			} else {
                $page = 1;
            }
		}
	} else if($juser->username){// NOn e' amministratore, se e' loggato allora e' PA

		$url = get_field_list('link-guida')['PA'];
		$page = get_field($article, 'pagina-guida-pa');
		// Se non trovo la pagina vedo se c'è nella guida pubblica altrimenti uso sempre la guida PA
		if(!$page) {
			$page = get_field($article, 'pagina-guida-public');
			if ($page) {
				$url = get_field_list('link-guida')['Pubblica'];
			} else{
                $page = 1;
            }
		}
	} else {
		$url = get_field_list('link-guida')['Pubblica'];
		$page = get_field($article, 'pagina-guida-public');
	}

    /**
     * Campi per settare la pagina custom da pagina php
     */


	if(!empty($_SESSION['guida_url_page'])){
	    $page = $_SESSION['guida_url_page'];
        $_SESSION['guida_url_page'] = null;
    }

	if($url) return $url.dechex($page);
}