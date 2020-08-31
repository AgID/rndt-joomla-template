<?php


// No direct access to this file
defined('_JEXEC') or die('Restricted access');

$baseUrl = JURI::root();
$baseUrl = strpos($baseUrl, 'https') !== false ? str_replace("https",GENERIC_FORCE_PROTOCOL,$baseUrl): str_replace("http",GENERIC_FORCE_PROTOCOL,$baseUrl);
$baseurlsTemplate = $baseUrl.'/templates/'.JFactory::getApplication()->getTemplate().'/';

define('BASE_URL_PROTO', $baseUrl);

/*
 * Cookie 'refer_url'
 * utile per tener traccia della pagina da cui si proviene, in questo modo è possibile gestire, in modo più idoneo,
 * i cookie nella pagina metadati.php
 *
 * @author paolo martufi 2017-06-27
 */
setcookie('refer_url', "ricercaDettagliata", time() + (3600), "/"); // 3600 = 1 giorno

function getListByName($name, $onlyValue = false, $noLang=false){

    $lang = JFactory::getLanguage();
    $lang_code = substr($lang->getTag(), 0,2);
    //$lang_code = "en"; //todo cablata lingua

    $arraySup = get_text("home.inspire_cluster");
    $arrayReturn = array();
    foreach ($arraySup[$name] as $key => $value){
        if (strpos($key, "-".$lang_code) !== false) {
            if($onlyValue)
                array_push($arrayReturn, array(
                        "key" => $value,
                        "value" => $value
                    )
                );
            else
                if ($noLang)
                    array_push($arrayReturn, array(
                            "key" => str_replace( "-".$lang_code, "", $key),
                            "value" => $value
                        )
                    );
                else
                    array_push($arrayReturn, array(
                            "key" => $key,
                            "value" => $value
                        )
                    );
        }
    }

    $arrayReturn = bubble_sort($arrayReturn);
    return $arrayReturn;
}

function getListByNameIT($name){

    $lang = JFactory::getLanguage();
    $lang_code = substr($lang->getTag(), 0,2);
    //$lang_code = "en"; //todo cablata lingua

    $arraySup = get_text("home.inspire_cluster");
    $arraySup2 = get_text("home.inspire_cluster");
    $arrayReturn = array();
    foreach ($arraySup[$name] as $key => $value){

        if (strpos($key, "-".$lang_code) !== false) {
            $keySup = explode("-", $key);
            array_push($arrayReturn, array(
                    "key" => $arraySup2["inspireThemes"][$keySup[0]."-it"],
                    "value" => $value
                )
            );
        }
    }

    $arrayReturn = bubble_sort($arrayReturn);
    return $arrayReturn;
}

function bubble_sort($arr) {
    $size = count($arr);
    for ($i=0; $i<$size; $i++) {
        for ($j=0; $j<$size-1-$i; $j++) {
            if ($arr[$j+1]['value'] < $arr[$j]['value']) {
                swap($arr, $j, $j+1);
            }
        }
    }
    return $arr;
}

function swap(&$arr, $a, $b) {
    $tmp = $arr[$a];
    $arr[$a] = $arr[$b];
    $arr[$b] = $tmp;
}


require_once JPATH_BASE . '/includes/functions.php';

/** ============ TUTTE LE PA =================*/
$urlAllPA = GPT_BASE_URL."/rest/RestUserAddOn/getAllPA";

/** ============= inspireThemes ============= */
$arrayInspireThemes = getListByNameIT('inspireThemes');
$arrayDataset1 = get_text("home.inspire_cluster")['priorityDataset'];
$arrayDataset2 = get_text("home.inspire_cluster")['openData'];

/** ============= services ============= */
$arrayServices = getListByName('advancedSearchServices',false,true);

/** ============= category ============= */
$arrayCategory = getListByName('advancedSearchCategory',false,true);

?>

<!-- LIBRERIE ESRI -->
<link rel="stylesheet" href="<?php echo $baseurlsTemplate;?>libs/bootstrap-select/bootstrap-select.min.css">
<link rel="stylesheet" href="https://js.arcgis.com/3.20/esri/css/esri.css">
<script src="<?php echo $baseurlsTemplate;?>libs/bootstrap-select/bootstrap-select.min.js"></script>
<script src="https://js.arcgis.com/3.20/"></script>

<!-- LIBRERIE BOOTSTRAP-SELECT -->
<!-- <script src="bootstrap-select/js/tabcomplete.min.js"></script>
<script src="bootstrap-select/js/livefilter.min.js"></script>
<script src="bootstrap-select/js/bootstrap-select.min.js"></script>
<script src="bootstrap-select/js/filterlist.min.js"></script>
<script src=bootstrap-select/js/plugins.js"></script>-->

<!-- INIZIO PAGINA -->
<div class="boxContainerSearchAdvance container-fluid">
    <div class="row">
        <div id="loadingSelectTotal" style="position: absolute;background: #ddd; width: 100%;height: 100%;z-index:5;text-align: center;padding-top: 30px;">
            <div class="contentLoading">
                <i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
                <span class="sr-only">Loading...</span> <?= JText::_('LOADING') ?>
            </div>
        </div>

        <div class="boxFormSearchAdvance col-md-6 noPadding">
            <form id="form-advance-search" method="POST">
                <div class="container-fluid box-form">
                    <div class="row">
                        <div class="checkbox col-md-12" role="radiogroup" aria-labelledby="selectionSearch">
                            <fieldset>
                                <legend class="label_bold" id="selectionSearch"><?= JText::_('ADVSEARCH_SELECT') ?></legend>
                                <ul class="checkbox-ul">
                                    <li>
                                        <label for="selection_search_all">
                                            <input id="selection_search_all" title="" type="radio" name="selection-search" checked value="all"> <?= JText::_('ADVSEARCH_ALL') ?>
                                        </label>
                                    </li>
                                    <li>
                                        <label for="selection_search_data">
                                            <input id="selection_search_data" title="" type="radio" name="selection-search" value="dati"> <?= JText::_('ADVSEARCH_DATA') ?>
                                            <div id="box-dati" class="box-checkbox ifRadioSelect">
                                                <label for="dati_dataset" class="block-label">
                                                    <input type="checkbox" id="dati_dataset" name="dati_dataset" title="" checked> <?= JText::_('ADVSEARCH_DATASET') ?>
                                                </label>
                                                <label for="dati_series" class="block-label">
                                                    <input type="checkbox" id="dati_series" name="dati_series" title="" checked> <?= JText::_('ADVSEARCH_SERIES') ?>
                                                </label>
                                            </div>

                                        </label>
                                    </li>

                                    <li>
                                        <label for="selection_search_services">
                                            <input id="selection_search_services" type="radio" name="selection-search" value="servizi" title="" > <?= JText::_('ADVSEARCH_SERVICES') ?>
                                        </label>
                                    </li>
                                </ul>
                            </fieldset>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-8" role="radiogroup" aria-labelledby="textFree">
                            <label class="label_bold" for="text_free_search"><?= JText::_('ADVSEARCH_TEXT_FREE_SEARCH') ?></label>
                            <input type="text" id="text_free_search" class="form-control" name="text-free" placeholder="<?= JText::_('ADVSEARCH_INSERT_WORD') ?>" autocomplete="off">
                            <fieldset>
                                <legend class="sr-only" id="textFree"><?= JText::_('ADVSEARCH_TEXT_FREE_SEARCH') ?></legend>
                                <ul class="checkbox-ul customUlRadio">
                                    <li>
                                        <label for="text_free_words">
                                            <input id="text_free_words" type="radio" name="text-free-radio" value="all" title="" checked> <?= JText::_('ADVSEARCH_ALL_WORDS') ?>
                                        </label>
                                    </li>
                                    <li>
                                        <label for="text_free_one_word">
                                            <input id="text_free_one_word" type="radio" name="text-free-radio" title="" value="one"> <?= JText::_('ADVSEARCH_AT_LIST_ONE_WORD') ?>
                                        </label>
                                    </li>
                                    <li>
                                        <label for="text_free_text">
                                            <input id="text_free_text" type="radio" name="text-free-radio" title="" value="text"> <?= JText::_('ADVSEARCH_TEXT') ?>
                                        </label>
                                    </li>
                                </ul>
                            </fieldset>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="label_bold" for="filterCustomSe"><?= JText::_('ADVSEARCH_SEARCH_IN') ?></label>
                            <select id="filterCustomSe" class="form-control" name="filter-search">
                                <option value=""><?= JText::_('ADVSEARCH_EVERYWHERE') ?></option>
                                <option value="title"><?= JText::_('ADVSEARCH_TITLE') ?></option>
                                <option value="abstract"><?= JText::_('ADVSEARCH_DESCRIPTION') ?></option>
                                <option value="apiso.Lineage"><?= JText::_('ADVSEARCH_HISTORY') ?></option>
                                <option value="apiso.AccessConstraints"><?= JText::_('ADVSEARCH_CONSTRAINTS') ?></option>
                            </select>
                        </div>
                    </div>
                    <div id="selection-search-tema-inspire" class="row ifRadioSelect">
                        <div class="row" style="margin-left: 0; margin-right:0;">
                            <div class="form-group col-md-12">
                                <label class="label_bold" for="inspireThemes-checkbox"><?= JText::_('ADVSEARCH_INSPIRE_THEME') ?></label>
                                <input id="inspireThemes-checkbox" type="hidden" name="inspireThemes" value="">
                                <div class="dropdown">
                                    <button class="btn btn-default btn-customform dropdown-toggle form-control text-left" type="button" data-toggle="dropdown"><?= JText::_('ADVSEARCH_SELECT_INSPIRE_THEME') ?>
                                        <span class="caret pull-right"></span>
                                    </button>
                                    <div class="dropdown-menu menuInspire">
                                        <div class="container-fluid">

                                            <?php foreach ($arrayInspireThemes as $item):?>
                                                <div class="col-md-6">
                                                    <label for="item_<?php echo $item['key'];?>">
                                                        <input type="checkbox" id="item_<?php echo $item['key'];?>" title="" name="inspireThemes-checkbox" value="<?php echo $item['key'];?>" title=""> <?php echo $item['value'];?>
                                                    </label>
                                                </div>
                                            <?php endforeach;?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-left: 0; margin-right:0;margin-top: 15px;">
                            <div class="form-group col-md-12">
                                <label class="label_bold" for="tema_iso"><?= JText::_('ADVSEARCH_ISO_THEME') ?></label>
                                <input id="tema_iso-checkbox" type="hidden" name="tema-iso" value="">
                                <div class="dropdown">
                                    <button class="btn btn-default btn-customform dropdown-toggle form-control text-left" type="button" data-toggle="dropdown"><?= JText::_('ADVSEARCH_SELECT_CATEGORY') ?>
                                        <span class="caret pull-right"></span>
                                    </button>
                                    <div class="dropdown-menu menuInspire">
                                        <div class="container-fluid">

                                            <?php foreach ($arrayCategory as $item):?>
                                                <div class="col-md-6">
                                                    <label for="item_<?php echo $item['key'];?>">
                                                        <input type="checkbox" id="item_<?php echo $item['key'];?>" title="" name="tema_iso-checkbox" value="<?php echo $item['key'];?>" title=""> <?php echo $item['value'];?>
                                                    </label>
                                                </div>
                                            <?php endforeach;?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="row" style="margin-left: 0; margin-right:0;margin-top: 15px;">
                            <div class="form-group col-md-12">
                                <label class="label_bold" for="tema_pdataset" style="text-transform: uppercase;"><?= JText::_('PDATASET') ?></label>
                                <input id="tema_pdataset-checkbox-prioritydataset" type="hidden" name="tema-pdataset-prioritydataset" value="">
                                <div class="dropdown">
                                    <button class="btn btn-default btn-customform dropdown-toggle form-control text-left" type="button" data-toggle="dropdown"><?= JText::_('ADVSEARCH_SELECT_PDATASET_OPENDATA') ?>
                                        <span class="caret pull-right"></span>
                                    </button>
                                    <div class="dropdown-menu menuInspire">
                                        <div class="container-fluid">
                                            <div class="col-md-12">
                                                <?php foreach($arrayDataset1 as $key => $cluster): ?>
                                                    <div class="col-md-6" style="min-width:421px;">
                                                        <label for="item_<?php echo $cluster['name'];?>">
                                                            <input type="checkbox" id="item_pdataset_<?php echo $cluster['name'];?>" title="" name="tema_pdataset-checkbox-prioritydataset" value='<?=json_encode($cluster['keywords']);?>' title=""> <?= htmlspecialchars($cluster[$lang_code]) ?>
                                                        </label>
                                                    </div>
                                                <?php endforeach;?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="row" style="margin-left: 0; margin-right:0;margin-top: 15px;">
                            <div class="form-group col-md-12">
                                <label class="label_bold" for="tema_pdataset" style="text-transform: uppercase;"><?= JText::_('OPENDATA') ?></label>
                                <input id="tema_pdataset-checkbox-opendata_control" type="hidden" name="OpenData" value="">
                                <input id="tema_pdataset-checkbox-opendata" type="hidden" name="tema-pdataset-opendata" value="">
                                <div class="dropdown">
                                    <button class="btn btn-default btn-customform dropdown-toggle form-control text-left" type="button" data-toggle="dropdown"><?= JText::_('ADVSEARCH_SELECT_PDATASET_OPENDATA') ?>
                                        <span class="caret pull-right"></span>
                                    </button>
                                    <div class="dropdown-menu menuInspire">
                                        <div class="container-fluid">
                                            <div class="col-md-12">
                                                <?php foreach($arrayDataset2 as $key => $cluster): ?>
                                                    <div class="col-md-6">
                                                        <label for="item_<?php echo $cluster['name'];?>">
                                                            <input type="checkbox" id="item_pdataset_<?php echo $cluster['name'];?>" title="" name="tema_pdataset-checkbox-opendata" value='<?=json_encode($cluster['keywords']);?>' title=""> <?= htmlspecialchars($cluster[$lang_code]) ?>
                                                        </label>
                                                    </div>
                                                <?php endforeach;?>
                                            </div>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div id="selection-search-servizio" class="row ifRadioSelect">
                        <div class="form-group col-md-12">
                            <label class="label_bold" for="services-checkbox"><?= JText::_('ADVSEARCH_SERVICE') ?></label>
                            <input id="services-checkbox" type="hidden" name="services" value="">
                            <div class="dropdown">
                                <button class="btn btn-default btn-customform dropdown-toggle form-control text-left" type="button" data-toggle="dropdown"><?= JText::_('ADVSEARCH_SELECT_SERVICES') ?>
                                    <span class="caret pull-right"></span>
                                </button>
                                <div class="dropdown-menu menuInspire">
                                    <div class="container-fluid">

                                        <?php foreach ($arrayServices as $item):?>
                                            <div class="col-md-6">
                                                <label for="item_<?php echo $item['key'];?>">
                                                    <input type="checkbox" id="item_<?php echo $item['key'];?>" name="services-checkbox" value="<?php echo $item['key'];?>" title=""> <?php echo $item['value'];?>
                                                </label>
                                            </div>
                                        <?php endforeach;?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label class="label_bold" for="keywords"><?= JText::_('ADVSEARCH_KEYWORD_SEARCH') ?> <span class="title-details"><?= JText::_('ADVSEARCH_COMMA_SEPARATED_KEYWORDS_SEARCH') ?></span></label>
                            <input type="text" class="form-control" id="keywords" name="keywords" placeholder="<?= JText::_('ADVSEARCH_KEYWORD_SEARCH') ?>..." title="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <!--                            <label class="label_bold" for="geometry-where">--><?//= JText::_('ADVSEARCH_WHERE') ?><!-- <span class="title-details">--><?//= JText::_('ADVSEARCH_DRAW_GEOGRAPHIC_AREA') ?><!--</span></label>-->
                            <label class="label_bold" for="geometry-where"><?= JText::_('ADVSEARCH_WHERE') ?></label>

                            <input id="geometry-where" type="hidden" name="extent" value="" title="">
                            <div class="form-group col-md-12 classContainer" role="radiogroup" aria-labelledby="spatial_rel" style="padding-left: 0px;">
                                <fieldset>

                                    <legend class="sr-only" id="spatial_rel"><?= JText::_('ADVSEARCH_GEOGRAPHIC_AREA') ?></legend>
                                    <!--
                                    * Fix: bug 107
                                    * Ho sostituito il btn-recover ("Azzera") con il radio spatialRel_everywhere che fa le stesse cose
                                    * ed ho cambiato l'ordine dei radio su indicazione di G.Campanile
                                    * @author paolo martufi 2017-06-28

                                    <label for="btn-recover" class="radio-inline">
                                        <button id="btn-recover" class="btn btn-success"><?= JText::_('RESTORE_SEARCH') ?></button>
                                    </label>
                                    -->
                                    <label for="spatialRel_everywhere" class="radio-inline">
                                        <input type="radio" id="spatialRel_everywhere" name="spatialRel" value="all" checked> <?= JText::_('SEARCH_EVERYWHERE') ?>
                                    </label>
                                    <label for="spatialRel_intersecting" class="radio-inline">
                                        <input type="radio" id="spatialRel_intersecting" name="spatialRel" value="Intersects"> <?= JText::_('ADVSEARCH_INTERSECTING') ?>
                                    </label>
                                    <label for="spatialRel_contained" class="radio-inline">
                                        <input type="radio" id="spatialRel_contained" name="spatialRel" value="esriSpatialRelWithin"> <?= JText::_('ADVSEARCH_COMPLETELY_CONTAINED') ?>
                                    </label>
                                </fieldset>
                            </div>
                            <br><br><br>
                            <span class="title-details"><?= JText::_('ADVSEARCH_DRAW_GEOGRAPHIC_AREA') ?></span>
                            <ul id="menuDove" class="nav nav-tabs gxeTabArray disabled">
                                <li class="active"><a data-toggle="tab" href="#box-area-geografica"><?= JText::_('ADVSEARCH_GEOGRAPHIC_AREA') ?></a></li>
                                <li><a data-toggle="tab" href="#box-disegna"><?= JText::_('ADVSEARCH_DRAW') ?></a></li>
                                <li><a data-toggle="tab" href="#box-coordinate"><?= JText::_('ADVSEARCH_COORDINATES') ?></a></li>
                            </ul>

                            <div class="tab-content">
                                <input type="hidden" name="regione-selected">
                                <input type="hidden" name="provincia-selected">
                                <input type="hidden" name="comune-selected">
                                <div id="box-area-geografica" class="tab-pane fade in active">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="form-group col-md-4 bootstrap-select-wrapper">
                                                <label for="ricerca-regione"><?= JText::_('SEARCH_REGION') ?></label>
                                                <select id="ricerca-regione" data-live-search="true" name="ricerca-regione" class="form-control input-menuDove" disabled>
                                                    <option value="-1"><?= JText::_('SEARCH_REGION') ?>...</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4 bootstrap-select-wrapper">
                                                <label for="ricerca-provincia"><?= JText::_('SEARCH_PROVINCE') ?></label>
                                                <select id="ricerca-provincia" data-live-search="true" name="ricerca-provincia" class="form-control input-menuDove" disabled>
                                                    <option value="-1"><?= JText::_('SEARCH_PROVINCE') ?>...</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4 bootstrap-select-wrapper">
                                                <label for="ricerca-comune"><?= JText::_('SEARCH_DISTRICT') ?></label>
                                                <select id="ricerca-comune" data-live-search="true" name="ricerca-comune" class="form-control input-menuDove" disabled>
                                                    <option value="-1"><?= JText::_('SEARCH_DISTRICT') ?>...</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div id="loadingSelect" class="row">
                                            <div class="col-md-12">
                                                <i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
                                                <span class="sr-only">Loading...</span> <?= JText::_('LOADING') ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="box-disegna" class="tab-pane fade">
                                    <!-- BOX DISEGNA -->
                                    <div id="info">
                                        <div id="extent" class="btn bgreen"> <i class="fa fa-paint-brush" aria-hidden="true"></i> <?= JText::_('ADVSEARCH_DRAW') ?></div>
                                    </div>

                                </div>
                                <div id="box-coordinate" class="tab-pane fade">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-4">
                                                <label for="box-coord-ymax-custom">YMAX</label>
                                                <input type="text" class="form-control input-menuDove" id="box-coord-ymax-custom" name="box-coord-ymax" value="90.00" disabled>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="box-coord-xmin-custom">XMIN</label>
                                                <input type="text" class="form-control input-menuDove" id="box-coord-xmin-custom" name="box-coord-xmin" value="-180.00" disabled>
                                            </div>
                                            <div class="col-md-4 col-md-offset-4">
                                                <label for="box-coord-xmax-custom">XMAX</label>
                                                <input type="text" class="form-control input-menuDove" id="box-coord-xmax-custom" name="box-coord-xmax" value="180.00" disabled>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-4">
                                                <label for="box-coord-ymin-custom">YMIN</label>
                                                <input type="text" class="form-control input-menuDove" id="box-coord-ymin-custom" name="box-coord-ymin" value="-90.00" disabled>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-4 top20">
                                                <div id="applicaCoord" class="btn bgreen"><?= JText::_('ADVSEARCH_APPLY') ?></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label class="label_bold" for="id_pa_search_text"><?= JText::_('ADVSEARCH_RESPONSIBLE_ADMINISTRATION') ?></label>
                            <input type="text" id="id_pa_search_text" title="" class="form-control form-controlCustom" name="admin-resp" onkeyup="showResult(this.value)" value="" required autocomplete="off" title="<?= JText::_('ADVSEARCH_RESPONSIBLE_ADMINISTRATION') ?>" placeholder="<?= JText::_('ADVSEARCH_RESPONSIBLE_ADMINISTRATION_SEARCH') ?>">
                            <input type="hidden" id="id_pa_search" name="id_pa_search">
                            <input type="hidden" id="id_cn_pa_search" name="id_cn_pa_search">
                            <div id="livesearch"></div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <h3><?= JText::_('ADVSEARCH_WHEN') ?></h3>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="time-da"><?= JText::_('ADVSEARCH_FROM') ?></label>
                            <input type="date" class="form-control" id="time-da" name="data-da">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="time-a"><?= JText::_('ADVSEARCH_TO') ?></label>
                            <input type="date" class="form-control" id="time-a" name="data-a">
                        </div>
                        <div class="form-group col-md-12 margin15" role="radiogroup" aria-labelledby="specialistDate" style="padding: 0px;">
                            <fieldset>

                                <legend class="sr-only" id="specialistDate"><?= JText::_('ADVSEARCH_WHEN') ?></legend>

                                <label for="inlineRadio4" class="radio-inline">
                                    <input type="checkbox" name="specialist-date_search" id="inlineRadio4" value="true" checked> <?= JText::_('ADVSEARCH_TEXT_CHECKBOX') ?>
                                </label>

                                <label for="inlineRadio2" class="radio-inline">
                                    <input type="radio" name="specialist-date" id="inlineRadio2" value="apiso.CreationDate"> <?= JText::_('ADVSEARCH_CREATION') ?>
                                </label>
                                <label for="inlineRadio1" class="radio-inline">
                                    <input type="radio" name="specialist-date" id="inlineRadio1" value="apiso.PublicationDate"> <?= JText::_('ADVSEARCH_PUBLICATION') ?>
                                </label>
                                <label for="inlineRadio3" class="radio-inline">
                                    <input type="radio" name="specialist-date" id="inlineRadio3" value="apiso.RevisionDate" checked> <?= JText::_('ADVSEARCH_REVISION') ?>
                                </label>


                            </fieldset>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <h3><?= JText::_('ADVSEARCH_VISUALIZATION_ORDER') ?></h3>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="advsearch_order_by"><?= JText::_('ADVSEARCH_ORDER_BY') ?></label>
                            <select id="advsearch_order_by" class="form-control" name="order">
                                <option value="-1"><?= JText::_('ADVSEARCH_SELECT_SORT_ORDER') ?></option>
                                <option value="relevance"><?= JText::_('ADVSEARCH_RELEVANCE') ?></option>
                                <option value="title"><?= JText::_('ADVSEARCH_TITLE') ?></option>
                                <option value="dateAscending"><?= JText::_('ADVSEARCH_DATE_ASC') ?></option>
                                <option value="dateDescending"><?= JText::_('ADVSEARCH_DATE_DESC') ?></option>
                                <option value="areaAscending"><?= JText::_('ADVSEARCH_AREA_ASC') ?></option>
                                <option value="areaDescending"><?= JText::_('ADVSEARCH_AREA_DESC') ?></option>
                            </select>
                        </div>

                    </div>
                </div>
                <div class="container-fluid boxButton">
                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" id="anteprimaBtn" class="btn bgreen" data-toggle="collapse" data-target="#details"><?= JText::_('ADVSEARCH_PREVIEW') ?></button>
                        </div>
                        <div class="col-md-6">
                            <button id="result-success" class="btn bgreen"><?= JText::_('ADVSEARCH_SHOW_RESULTS') ?></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="boxDetailsClass col-md-6 noPadding">
            <div id="map" class="container-fluid noPadding">
                <div id="details" class="collapse col-md-8">
                    <div class="loadingDetails">
                        <i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
                        <span class="sr-only">Loading...</span> <?= JText::_('LOADING') ?>
                    </div>
                    <div id="panel-details">
                        <div id="panel-details-filter">
                            <div>
                                <?= JText::_('METADATA_FILTERS') ?>:
                            </div>
                            <ul id="filters-box-deatils"></ul>
                        </div>
                        <div id="panel-details-list">
                            <div class="header-list">
                                <?= JText::_('ADVSEARCH_NO_RESULTS') ?>
                            </div>
                            <div class="link-export-query">
                                <a onclick="javascript:window.prompt('Query:',window.linkExportQuery+'')"><i class="fa fa-link" aria-hidden="true"></i></a>
                            </div>
                            <div class="body-list">
                                <div class="content-list-result"></div>
                                <div class="more-results">
                                    <span class="message"><?= JText::_('ADVSEARCH_SHOW_MORE_RESULTS') ?></span>
                                    <span class="message-loading">
                                        <i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
                                        <span class="sr-only">Loading...</span> <?= JText::_('LOADING') ?>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="details-button" class="visible-custom">
                    <i class="fa fa-eye" aria-hidden="true"></i> <span class="details-custom"><?= JText::_('ADVSEARCH_SHOW_RESULTS_PREVIEW') ?></span>
                    <i class="fa fa-eye-slash" aria-hidden="true"></i>
                </div>
                <div id="details-button-settings" class="visible-custom">
                    <i class="fa fa-filter" aria-hidden="true"></i> <span class="details-setting"><?= JText::_('ADVSEARCH_SHOW_FILTERS') ?></span>
                    <i class="fa fa-times" aria-hidden="true"></i>
                </div>

                <div id="details-button-layerList" class="visible-custom">
                    <i class="fa fa-list" aria-hidden="true"></i>
                </div>

                <div id="layerlistContent" style="display: none;"></div>
            </div>

        </div>

    </div>


</div>



<script>
    esriConfig.defaults.io.proxyUrl = "<?php echo $baseUrl;?>/proxy4/proxy.ashx";
    esriConfig.defaults.io.alwaysUseProxy = false;

    function readCOokieAndResetInput(){
        window.saveCookie = JSON.parse(readCookie("saveObjSearchText"));
        window.saveCompositeStr = JSON.parse(readCookie("saveCompositeStr"));
        if(window.saveCookie){
              for(var x in window.saveCookie){
                  //if(x == 'keywords') return;
                  if(x == 'text_free_search') jQuery("input[name=text-free]")[0].value = window.saveCookie[x];
                  if(x == 'admin_resp') jQuery("input[name=admin-resp]")[0].value = window.saveCookie[x];
                  //if(x == 'type') return;
              }

              for(var x in window.saveCompositeStr){
                  if(x == "regioneSelected" || x == "provinciaSelected" || x == "comuneSelected"){

                      if(jQuery("#menuDove").hasClass('disabled')){
                          jQuery("#menuDove").removeClass('disabled');
                          jQuery(".input-menuDove").prop('disabled', false);
                      }

                      if(x == "regioneSelected"){
                          var regInt = setInterval(function(){
                              if(jQuery("select[name=ricerca-regione]")[0].options.length != 1){
                                  clearInterval(regInt);
                                  jQuery("select[name=ricerca-regione]").val(parseInt(window.saveCompositeStr["regioneSelected"]));
                                  setTimeout(function(){
                                      jQuery("select[name=ricerca-regione]").change();
                                      selectAfter("provinciaSelected","ricerca-provincia");
                                  },500);

                              }
                          },100);
                      }

                      if(x == "provinciaSelected" && !window.saveCompositeStr["regioneSelected"]){
                          selectAfter("provinciaSelected","ricerca-provincia");
                      }

                      if(x == "comuneSelected" && !window.saveCompositeStr["regioneSelected"] && !window.saveCompositeStr["provinciaSelected"]){
                          selectAfter("comuneSelected","ricerca-comune");
                      }

                  }
              }

        }
    }

    function selectAfter(found,name){
        if(window.saveCompositeStr[found]){
            var f = setInterval(function(){
                if(jQuery("select[name="+name+"]")[0].options.length != 1){
                    clearInterval(f);
                    jQuery("select[name="+name+"]").val(parseInt(window.saveCompositeStr[found]));
                    jQuery("select[name="+name+"]").change();
                    if(found == "provinciaSelected") selectAfter("comuneSelected","ricerca-comune");
                }
            },100);

        }
    }


    readCOokieAndResetInput();
    /** ============= GLOBAL VAR ============= */

    var pathFolder = "<?php echo $baseurls;?>advancedSearch/";

    var objSearch = <?php echo json_encode(get_text("home.inspire_cluster")['metadataFilters'][$lang_code]); ?>;

    var startIndex = 1;
    var itemsPerPage = 15;
    var maxResultSearch = 10;

    window.controlGraphic = false;
    window.controlMoreResult = false;
    window.dontClose = false;

    var debug = false;
    var obj;

    jQuery(document).ready(function() {

        require([
            "esri/map", "esri/toolbars/draw", "esri/symbols/SimpleMarkerSymbol",
            "esri/symbols/SimpleLineSymbol","esri/symbols/SimpleFillSymbol", "esri/symbols/PictureFillSymbol",
            "esri/symbols/CartographicLineSymbol", "esri/graphic", "esri/Color",
            "esri/geometry/Geometry", "esri/geometry/Extent", "dojo/dom",
            "esri/geometry/Polygon", "esri/SpatialReference", "dojo/on",
            "dojo/_base/declare", "dojo/_base/lang", "esri/geometry/Point",
            "esri/geometry/webMercatorUtils", "esri/layers/GraphicsLayer", "esri/dijit/LayerList",
            "dojo/domReady!"
        ], function(
            Map, Draw, SimpleMarkerSymbol,
            SimpleLineSymbol, SimpleFillSymbol, PictureFillSymbol,
            CartographicLineSymbol, Graphic, Color,
            Geometry, Extent, dom,
            Polygon, SpatialReference, on,
            declare, lang, Point,
            webMercatorUtils, GraphicsLayer,LayerList
        ) {
            var clazz = declare(null, {
                map: null,
                drawBox: null,
                layerTemp: null,
                layerTemp2: null,

                constructor: function () {
                    this.initMap();
                    this.addComuniLayer();
                    this.addWidgets();

                    //carico lista regioni
                    this.getRegioni();
                    this.getProvince(true);
                    this.getComuni(true,true);
                },


                /** ============= INIT MAP ============= */

                initMap: function () {
                    this.map = new Map("map", {
                        center: [11.5, 41.7],
                        zoom: 6,
                        basemap: "hybrid",
                        spatialReference: new SpatialReference(102100)
                    });

                    this.layerTemp = new GraphicsLayer();
                    this.layerTemp2 = new GraphicsLayer();
                    this.map.addLayer(this.layerTemp);
                    this.map.addLayer(this.layerTemp2);

                    this.map.on("load", lang.hitch(this,this.initEvent));
                    this.layerTemp2.on("mouse-move", lang.hitch(this,this.overLayer));
                    this.map.on("mouse-move", function(){
                        if(!window.saltaMouseMove){
                            jQuery(".result-in-box-list").removeClass("overMapColor");
                        }

                        window.saltaMouseMove = false;
                    });
                },

                addWidgets:function(){
                   this.addLayerList();
                },

                addLayerList:function(){
                    var layerList = new LayerList({
                        map: this.map,
                        layers: [
                            /*{layer:this.map.getLayer("graphicsLayer2"), title:"Risultati ricerca", id: "graphicsLayer2"},*/
                            {layer:this.map.getLayer("graphicsLayer3"), title:"<?= JText::_('SEARCH_RESULT') ?>",id: "graphicsLayer3"},
                            {layer:this.map.getLayer("layer1"), title:"<?= JText::_('SEARCH_WHERE') ?>", id: "layer1"},
                            {layer:this.map.getLayer("comuni"), title:"<?= JText::_('SEARCH_COMUNI') ?>", id: "comuni"},
                            {layer:this.map.getLayer("layer0"), title:"<?= JText::_('SEARCH_MAP') ?>", id: "layer0"}
                        ],
                        visible: false
                    },"layerlistContent");
                    layerList.startup();

                    jQuery("#details-button-layerList").click(function(){
                        if(!jQuery("#details-button-layerList").hasClass("open")){
                            jQuery("#details-button-layerList").addClass("open");
                            jQuery("#layerlistContent").show();
                        }else{
                            jQuery("#details-button-layerList").removeClass("open");
                            jQuery("#layerlistContent").hide();
                        }
                    });


                },

                addComuniLayer:function (){
                    <?php $fields = get_field_list("ricerca-dettagliata");?>
                    var urlComuni = "<?php echo $fields['comuni'];?>";

                    if(urlComuni != ""){
                        var comuniLayer = new esri.layers.FeatureLayer(urlComuni,{id:"comuni",outFields:["*"]});
                        var symbol = new SimpleFillSymbol().setOutline(new SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new Color([255,255,255]), 2));   ;
                        var renderer = new esri.renderer.SimpleRenderer(symbol);
                        comuniLayer.setRenderer(renderer);

                        
                        var template = new esri.InfoTemplate("${comune}", "${*}");
                        comuniLayer.setInfoTemplate(template);

                        this.map.addLayer(comuniLayer);

                        /*var that = this;
                        this.map.on("click", function(e){

                        });*/
                    }

                    //todo province e regioni
                },

                overLayer: function(e){
                    window.saltaMouseMove = true;
                    jQuery(".result-in-box-list").removeClass("overMapColor");

                    /*
                    var array = jQuery(".result-in-box-list").filter(function(a,item){return JSON.stringify(JSON.parse(item.getAttribute("data-geometry")).geometry) == JSON.stringify(e.graphic.geometry);})
                    jQuery.each(array, function(i,item){
                        jQuery(item).addClass("overMapColor") ;
                    });*/

                    for(var i = 0; i<this.layerTemp2.graphics.length;i++){

                        if(esri.geometry.Extent(this.layerTemp2.graphics[i].geometry).contains(e.mapPoint)){
                            var that = this;
                            var array = jQuery(".result-in-box-list").filter(function(a,item){return JSON.stringify(JSON.parse(item.getAttribute("data-geometry")).geometry) == JSON.stringify(that.layerTemp2.graphics[i].geometry);});
                            jQuery.each(array, function(i,item){
                                jQuery(item).addClass("overMapColor") ;
                            });
                        }
                        //console.log(esri.geometry.Extent(this.layerTemp2.graphics[i].geometry).contains(e.mapPoint))
                    }
                    //debugger;

                },

                initEvent: function () {
                    var cuADV = this;

                    //disegna su mappa
                    this.drawBox = new Draw(this.map);
                    this.drawBox.on("draw-end", lang.hitch(this,this.clearMap));
                    this.drawBox.on("draw-end", lang.hitch(this,this.addGraphic));

                    //event
                    on(dom.byId("info"), "click", function(evt) {
                        if ( evt.target.id === "info" ) return;
                        var tool = evt.target.id.toLowerCase();

                        jQuery('#ricerca-regione').val("-1");
                        if(jQuery("#content").hasClass("cursorCustom")){
                            jQuery("#content").removeClass("cursorCustom");
                            cuADV.drawBox.deactivate();
                            cuADV.map.enableMapNavigation();
                        }else{
                            jQuery("#content").addClass("cursorCustom");

                            cuADV.drawBox.activate(tool);
                            cuADV.map.disableMapNavigation();
                        }
                    });

                    /*
                     * Fix: bug 107
                     * Ho sostituito il btn-recover ("Azzera") con un radio che fa le stesse cose
                     * @author paolo martufi 2017-06-28

                     jQuery("#btn-recover").click(function(e){
                     e.stopPropagation();
                     e.preventDefault();
                     jQuery("#box-coord-ymax-custom")[0].value = "";
                     jQuery("#box-coord-ymin-custom")[0].value = "";
                     jQuery("#box-coord-xmax-custom")[0].value = "";
                     jQuery("#box-coord-xmin-custom")[0].value = "";

                     jQuery("#geometry-where")[0].value = "";
                     cuADV.clearMap();
                     jQuery('#ricerca-regione').val("-1");

                     jQuery("#content").removeClass("cursorCustom");
                     cuADV.drawBox.deactivate();
                     cuADV.map.enableMapNavigation();
                     });
                     */
                    jQuery("#spatialRel_everywhere").click(function(e){

                        jQuery("#box-coord-ymax-custom")[0].value = "";
                        jQuery("#box-coord-ymin-custom")[0].value = "";
                        jQuery("#box-coord-xmax-custom")[0].value = "";
                        jQuery("#box-coord-xmin-custom")[0].value = "";

                        jQuery("#geometry-where")[0].value = "";
                        cuADV.clearMap();
                        jQuery('#ricerca-regione').val("-1");

                        jQuery("#content").removeClass("cursorCustom");
                        cuADV.drawBox.deactivate();
                        cuADV.map.enableMapNavigation();

                        /*
                         * Fix: bug 155
                         * pulisco le opzioni di "provincia" e "comuni"
                         * @author paolo martufi 2017-06-28
                         */
                        cuADV.cleanSelection(false,true,true);

                    });

                    on(dom.byId("applicaCoord"), "click", function() {

                        cuADV.map.disableMapNavigation();

                        if(
                            jQuery("#box-coord-ymax-custom")[0].value != null &&
                            jQuery("#box-coord-ymin-custom")[0].value != null &&
                            jQuery("#box-coord-xmax-custom")[0].value != null &&
                            jQuery("#box-coord-xmin-custom")[0].value != null
                        ){
                            var extent = new Extent(
                                parseFloat(jQuery("#box-coord-xmin-custom")[0].value),
                                parseFloat(jQuery("#box-coord-ymin-custom")[0].value),
                                parseFloat(jQuery("#box-coord-xmax-custom")[0].value),
                                parseFloat(jQuery("#box-coord-ymax-custom")[0].value),
                                cuADV.map.spatialReference
                            );
                            extent.spatialReference.wkid = 4326;
                            var obj = {geometry: extent};
                            cuADV.clearMap();
                            cuADV.addGraphic(obj);
                        }else{
                            alert("Valori errati")
                        }


                    });

                    jQuery('#ricerca-regione').on('change', function() {

                        jQuery('input[name=regione-selected]')[0].value = this.value;
                        if(this.value != -1){

                            //setTimeout(function(){jQuery('#ricerca-provincia').selectpicker()},500);
                            var option = jQuery(this).find(":selected")[0];

                            var geometryParse = JSON.parse(option.attributes['data-geometry'].value);

                            var geometry = new Polygon(geometryParse);
                            geometry.setSpatialReference(new SpatialReference({wkid:cuADV.map.spatialReference.wkid}));

                            var cod_reg = option.attributes['data-cod-reg'].value;
                            var obj = {geometry: geometry.getExtent()};
                            cuADV.clearMap();
                            cuADV.addGraphic(obj);
                            cuADV.getProvince(cod_reg);
                        }else{
                            cuADV.getProvince(true);
                            cuADV.getComuni(true);
                            cuADV.cleanSelection(false,true,true);
                        }

                    });

                    jQuery('#ricerca-provincia').on('change', function() {

                        jQuery('input[name=provincia-selected]')[0].value = this.value;
                        if(this.value != -1){

                            //setTimeout(function(){jQuery('#ricerca-comune').selectpicker()},500);
                            var option = jQuery(this).find(":selected")[0];

                            var geometryParse = JSON.parse(option.attributes['data-geometry'].value);

                            var geometry = new Polygon(geometryParse);
                            geometry.setSpatialReference(new SpatialReference({wkid:cuADV.map.spatialReference.wkid}));

                            var cod_reg = option.attributes['data-cod-reg'].value;
                            var cod_pro = option.attributes['data-cod-pro'].value;
                            jQuery('#ricerca-regione').val(cod_reg).selectpicker('refresh');

                            var obj = {geometry: geometry.getExtent()};
                            cuADV.clearMap();
                            cuADV.addGraphic(obj);
                            cuADV.getComuni(cod_reg,cod_pro);
                        }else{

                            cuADV.getComuni(true);
                            jQuery('#ricerca-regione').val("-1").selectpicker('refresh');
                            cuADV.cleanSelection(false,false,true);
                        }

                    });

                    jQuery('#ricerca-comune').on('change', function() {

                        jQuery('input[name=comune-selected]')[0].value = this.value;
                        if(this.value != -1){
                            var option = jQuery(this).find(":selected")[0];

                            var cod_reg = option.attributes['data-cod-reg'].value;
                            var cod_pro = option.attributes['data-cod-pro'].value;

                            jQuery('#ricerca-provincia').val(cod_pro).selectpicker('refresh');
                            jQuery('#ricerca-regione').val(cod_reg).selectpicker('refresh');
                            var obj = {
                                geometry: cuADV.generateGeometryByJson(option.attributes['data-geometry'].value)
                            };
                            cuADV.clearMap();
                            cuADV.addGraphic(obj);
                        }else{
                            jQuery('#ricerca-provincia').val("-1").selectpicker('refresh');
                            jQuery('#ricerca-regione').val("-1").selectpicker('refresh');
                        }

                    });

                    setTimeout(function(){jQuery("#loadingSelectTotal").hide();},500);
                },

                generateGeometryByJson: function(json) {
                    var geometryParse = JSON.parse(json);

                    var geometry = new Polygon(geometryParse);
                    geometry.setSpatialReference(new SpatialReference({wkid:this.map.spatialReference.wkid}));

                    return geometry.getExtent();
                },

                riGenerateGeometryByJson: function(json) {
                    var arraySup = [];
                    /* for(var i = 0; i < json.coordinates[0].length; i++){

                     var point = new Point(json.coordinates[0][i][1], json.coordinates[0][i][0]);
                     //arraySup.push(this.convertCoordinatesWebMercator(point));
                     arraySup.push(point);
                     }*/


                    var polygonJson  = {"rings":json.coordinates,"spatialReference":{"wkid":"4326"}};
                    var geometry = new Polygon(polygonJson);
                    var convert = this.convertCoordinatesWebMercator(geometry);
                    return convert.getExtent();
                },



                convertCoordinatesWebMercator: function(point){
                    var webMerc = webMercatorUtils.geographicToWebMercator(point);
                    //return [webMerc.y,webMerc.x];
                    return webMerc;
                },

                convertCoordinatesGeographic: function(point){
                    if(point.spatialReference.wkid == 102100){
                        point = webMercatorUtils.webMercatorToGeographic(point);
                    }
                    return point;
                },

                clearMap: function() {
                    this.layerTemp2.clear();
                },

                wgs84Geom: function (geom) {
                    if(geom.spatialReference.wkid == 102100){
                        geom = webMercatorUtils.webMercatorToGeographic(geom);
                    }

                    return geom;
                },

                setCoordinateBox: function(geom){
                    jQuery("#box-coord-xmin-custom")[0].value = geom.xmin;
                    jQuery("#box-coord-ymin-custom")[0].value = geom.ymin;
                    jQuery("#box-coord-xmax-custom")[0].value = geom.xmax;
                    jQuery("#box-coord-ymax-custom")[0].value = geom.ymax;
                },

                addGraphic: function(evt,control) {
                    var geom = evt.geometry;
                    var geomGeo = evt.geometry.spatialReference.wkid == 102100 ? webMercatorUtils.webMercatorToGeographic(geom) : geom;
                    var geomWebMerc = evt.geometry.spatialReference.wkid == 4326 ? webMercatorUtils.geographicToWebMercator(geom) : geom;


                    var polySymbolRed = new SimpleFillSymbol(
                        SimpleLineSymbol.STYLE_SOLID,
                        new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
                            new Color([255, 0, 0, 1]), 1),
                        new Color([0, 0, 0, 0.2]));

                    //deactivate the toolbar and clear existing graphics

                    this.drawBox.deactivate();
                    this.map.enableMapNavigation();

                    jQuery("#content").removeClass("cursorCustom");

                    if(!window.controlGraphic){

                        this.setCoordinateBox(geomGeo);
                        jQuery("#geometry-where")[0].value =
                            parseFloat(geomGeo.xmin)+","+
                            parseFloat(geomGeo.ymin)+","+
                            parseFloat(geomGeo.xmax)+","+
                            parseFloat(geomGeo.ymax);
                        window.controlGraphic = false;
                    }

                    /*this.map.setExtent(evt.geometry,true);*/
                    this.layerTemp2.add(new Graphic(geomWebMerc, polySymbolRed));
                    if(!control) this.map.setExtent(new Extent(geomWebMerc));
                },


                goInExtent: function(geom) {
                    this.map.setExtent(new esri.geometry.Extent(geom.geometry))
                },

                removeGraphicTemp: function(){
                    this.layerTemp.clear();
                    //this.layerTemp2.setVisibility(true);
                },

                addGraphicTemp: function(evt) {
                    jQuery(".result-in-box-list").removeClass("overMapColor");
                    this.layerTemp.clear();
                    //this.layerTemp2.setVisibility(false);

                    var polySymbolRed = new SimpleFillSymbol(
                        SimpleLineSymbol.STYLE_SOLID,
                        new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
                            new Color([199, 178, 27, 1]), 1),
                        new Color([199, 178, 27, 0.6]));


                    this.layerTemp.add(new Graphic(evt.geometry, polySymbolRed));
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

                    jQuery("#loadingSelect").show();
                    jQuery.getJSON( file, function( data ) {

                        jQuery("#loadingSelect").fadeOut(1000);
                        var arraySup = data.features;
                        if(arraySup.length != 0 ){
                            jQuery.each(that.orderA(arraySup,"NOME_REG"), function (i, item) {
                                var attributes = item.attributes;
                                var geometry = item.geometry;

                                selectObject.append(jQuery('<option>', {
                                    value: attributes['COD_REG'],
                                    text : attributes['NOME_REG'],
                                    "data-id": attributes['OBJECTID'],
                                    "data-cod-reg": attributes['COD_REG'],
                                    "data-geometry": JSON.stringify(geometry)
                                }));
                            });
                            selectObject.selectpicker("destroy");
                            selectObject.selectpicker();
                        }

                    });
                },

                getProvince: function(cod_reg){
                    var that = this;
                    var file = pathFolder+"Province/Province.json";
                    var selectObject = jQuery("#ricerca-provincia");
                    this.cleanSelection(false,true,true);

                    jQuery("#loadingSelect").show();
                    jQuery.getJSON( file, function( data ) {

                        jQuery("#loadingSelect").fadeOut(1000);
                        var arraySup = data.features;
                        var newArray = [];
                        if(arraySup.length != 0 ){
                            jQuery.each(that.orderA(arraySup,"NOME_PRO"), function (i, item) {
                                var attributes = item.attributes;
                                var geometry = item.geometry;

                                if(cod_reg ===true || attributes['COD_REG'] == cod_reg){
                                    selectObject.append(jQuery('<option>', {
                                        value: attributes['COD_PRO'],
                                        text : attributes['NOME_PRO'],
                                        "data-id": attributes['OBJECTID'],
                                        "data-cod-reg": attributes['COD_REG'],
                                        "data-cod-pro": attributes['COD_PRO'],
                                        "data-geometry": JSON.stringify(geometry)
                                    }));
                                    newArray.push(attributes['COD_PRO']);
                                }
                            });

                            selectObject.selectpicker("destroy");
                            selectObject.selectpicker();
                            that.getComuni(cod_reg,newArray);
                        }

                    });
                },

                getComuni: function(cod_reg,cod_pro){
                    var that = this;
                    var file = cod_reg === true ? pathFolder+"Comuni/Comuni.json" : pathFolder+"Comuni/"+this.getNameFileComuni(cod_reg)+".json";
                    var selectObject = jQuery("#ricerca-comune");
                    this.cleanSelection(false,false,true);

                    jQuery("#loadingSelect").show();
                    jQuery.getJSON( file, function( data ) {

                        jQuery("#loadingSelect").fadeOut(1000);
                        var arraySup = data.features;
                        if(arraySup.length != 0 ){
                            jQuery.each(that.orderA(arraySup,"NOME_COM"), function (i, item) {
                                var attributes = item.attributes;
                                var geometry = item.geometry;

                                if(cod_pro === true || attributes['COD_PRO'] == cod_pro || (Array.isArray(cod_pro) && cod_pro.indexOf(attributes['COD_PRO']) != -1)){
                                    selectObject.append(jQuery('<option>', {
                                        value: attributes['PRO_COM'],
                                        text : attributes['NOME_COM'],
                                        "data-id": attributes['OBJECTID'],
                                        "data-pro-com": attributes['PRO_COM'],
                                        "data-cod-reg": attributes['COD_REG'],
                                        "data-cod-pro": attributes['COD_PRO'],
                                        "data-geometry": JSON.stringify(geometry)
                                    }));
                                }

                            });

                            selectObject.selectpicker("destroy");
                            selectObject.selectpicker();

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

        /*
         * @author paolo martufi 2017-06-27
         */
        initValuesOnBack();

        /*
         * @author paolo martufi 2017-06-28
         */
        jQuery("#menuDove a").click(function(e){
//            var all = jQuery("#spatialRel_everywhere").is(':checked');
            if(jQuery("#menuDove").hasClass('disabled')){
                e.stopPropagation();
                e.preventDefault();
            }
        });

        jQuery("#extent").click(function(e){
            if(jQuery("#menuDove").hasClass('disabled')){
                e.stopPropagation();
                e.preventDefault();
            }
        });

        jQuery("#applicaCoord").click(function(e){
            if(jQuery("#menuDove").hasClass('disabled')){
                e.stopPropagation();
                e.preventDefault();
            }
        });

        /*
         * @author paolo martufi 2017-06-28
         */
        jQuery('input[type=radio][name=spatialRel]').change(function() {
            if(this.value == "all"){
                jQuery("#menuDove").addClass('disabled');
                jQuery(".input-menuDove").prop('disabled', true);
                jQuery(".btn-CustomSelect").addClass('disabled');
                jQuery(".bootstrap-select").addClass('disabled');
            }else{
                jQuery("#menuDove").removeClass('disabled');
                jQuery(".btn-CustomSelect").removeClass('disabled');
                jQuery(".bootstrap-select").removeClass('disabled');
                jQuery(".input-menuDove").prop('disabled', false);
                //jQuery('#ricerca-regione').selectpicker();
            }
        });

        jQuery(window).resize(function(){
            if(jQuery('#details').hasClass("in")){
                jQuery('#form-advance-search').trigger("click");
            }
        });

    });

    /** ============= CHANGE RADIO SELEZIONA COSA CERCARE ============= */

    jQuery('#form-advance-search').on('keyup keypress', function(e) {
		//todo
		if(!jQuery("#result-success").is(":focus")){
			var keyCode = e.keyCode || e.which;
			if (keyCode === 13) {
				e.preventDefault();

				window.dontClose = true;
				jQuery('#anteprimaBtn').trigger("click");

				return false;
			}
		}

    });
	
    /** ============= CHANGE PRIORITY DATASET - OPENDATA  ============= */
	
	/*jQuery('input[name="tema_pdataset-checkbox"').change(function(){
		var attr = JSON.parse(this.value).join(",");
		var val = jQuery("#keywords")[0].value;
		if(this.checked) {
			val += val===""?attr:","+attr;
		}else{
			val = val.indexOf(attr+",") !== -1 ? val.replace(attr+",", ""):val.replace(attr, "");
		}
		
		if(val === ",") val = "";
		if(val.charAt(0) === ",") val = val.substr(1);
		if(val.charAt(val.length - 1) === ",") val = val.substr(0,val.length-1);
	
		
		jQuery("#keywords")[0].value = val;
	});*/
	

    /** ============= CHANGE RADIO SELEZIONA COSA CERCARE ============= */

    jQuery('input[type=radio][name=selection-search]').change(function() {
        jQuery(".ifRadioSelect").hide();
        if (this.value == 'dati') {
            jQuery("#selection-search-tema-inspire").show();
            jQuery("#box-dati").css('display', 'inline-block');

        }else if (this.value == 'servizi') {
            jQuery("#selection-search-servizio").show();
        }

    });

    /*
     * @author paolo martufi 2017-06-27
     */
    function initValuesOnBack()
    {
        /*
         * Fix : Bug 139
         * nel caso si torni alla pagina tramite "back" ed in una precedente ricerca era stato selezionato "dati",
         * vanno mostrati i relativi div: #selection-search-tema-inspire e #box-dati
         * @author paolo martufi 2017-06-27
         */
        var dataIsChecked = jQuery('#selection_search_data').is(':checked');
        if(dataIsChecked)
        {
            jQuery(".ifRadioSelect").hide();
            jQuery("#selection-search-tema-inspire").show();
            jQuery("#box-dati").css('display', 'inline-block');
        }

        /* Fix: Bug 140
         * ricostruisce il valore del parametro inspireThemes presente nel cookie a partire dai valori di inspireThemes-checkbox
         * La gestione di questi valori avviene tramite push su un array globale, e nel
         * caso in cui si torni alla ricerca dettagliata tramite il pulsante back del browser e si aggiungano altri Inspire,
         * viene ricostruita la stringa solo a partire da quelli nuovi.
         * Per questo è necessario verificare se ci sono parametri da aggiungere allo stack
         * @author paolo martufi 2017-06-28
         */
        jQuery('input[type=checkbox][name=inspireThemes-checkbox]').each(function() {
            supportChangeStr("#inspireThemes-checkbox",this.checked,this.value, '" OR "', 1);
        });
        jQuery('input[type=checkbox][name=tema_iso-checkbox]').each(function() {
            supportChangeStr("#tema_iso-checkbox",this.checked,this.value, '","', 2);
        });
	
		jQuery('input[type=checkbox][name=tema_pdataset-checkbox-prioritydataset]').each(function() {
			supportChangeStr("#tema_pdataset-checkbox-prioritydataset",this.checked,this.value, '" OR "',4);
		});
		
		jQuery('input[type=checkbox][name=tema_pdataset-checkbox-opendata]').each(function() {
			//jQuery("#tema_pdataset-checkbox-opendata_control")[0].checked = jQuery('input[type=checkbox][name=tema_pdataset-checkbox-opendata]:checked').length !== 0;
			supportChangeStr("#tema_pdataset-checkbox-opendata",this.checked,this.value, '" OR "',5);
		});
    }



    /** ============= CHANGE RADIO text libero ============= */

    jQuery('input[type=radio][name=text-free-radio]').change(function() {
        if (this.value == 'text') {
            jQuery('#filterCustomSe').attr('disabled', 'disabled');
            jQuery("#filterCustomSe option:first").attr('selected','selected');
        }else{
            jQuery('#filterCustomSe').removeAttr('disabled');
        }

    });


    /** ============= CHANGE check -prioritydataset-checkbox ============= */

    jQuery('input[type=checkbox][name=tema_pdataset-checkbox-prioritydataset]').change(function() {
        supportChangeStr("#tema_pdataset-checkbox-prioritydataset",this.checked,this.value, '" OR "',4);
    });
	
    /** ============= CHANGE check -opendata ============= */

    jQuery('input[type=checkbox][name=tema_pdataset-checkbox-opendata]').change(function() {
		jQuery("#tema_pdataset-checkbox-opendata_control")[0].value = jQuery('input[type=checkbox][name=tema_pdataset-checkbox-opendata]:checked').length !== 0 ? 1:"";
        supportChangeStr("#tema_pdataset-checkbox-opendata",this.checked,this.value, '" OR "',5);
    });

    /** ============= CHANGE check inspireThemes-checkbox ============= */

    jQuery('input[type=checkbox][name=inspireThemes-checkbox]').change(function() {
        supportChangeStr("#inspireThemes-checkbox",this.checked,this.value, '" OR "',1);
    });

    /** ============= CHANGE check tema_iso-checkbox ============= */

    jQuery('input[type=checkbox][name=tema_iso-checkbox]').change(function() {
        supportChangeStr("#tema_iso-checkbox",this.checked,this.value, '","',2);
    });

    /** ============= CHANGE check services-checkbox ============= */

    jQuery('input[type=checkbox][name=services-checkbox]').change(function() {
        supportChangeStr("#services-checkbox",this.checked,this.value, " OR ",3);
    });


    /** ============= CLICK VISUALIZZA RISULTATI ============= */

    jQuery('#result-success').click(function(e) {
        createObjUrl();
        e.stopPropagation();
        e.preventDefault();
		saveAllInputCheck();
        window.location="<?= BASE_URL_PROTO . JText::_('URL_METADATA') ?>";
    });


    /** ============= CLICK PREVENT CHECKBOX TEMA INSPIRE ============= */

    jQuery('.menuInspire').click(function(e) {
        e.stopPropagation();
    });


    /** ============= CLICK FORM CLOSE ANTEPRIMA ============= */

    jQuery('#form-advance-search').click(function(e) {
        if(jQuery('#details').hasClass("in")){
            jQuery('#details').addClass("collapse");
            jQuery('#details').removeClass("in");
            jQuery('#details-button').css("left", "0px");
            jQuery('#details-button-settings').css("left", "0px");

            //reset pagination
            startIndex = 1;
            itemsPerPage = 15;
        }
    });


    /** ============= CLICK IMPOSTAZIONI ============= */

    jQuery('#details-button-settings').click(function(e) {
        var openPanelControl = jQuery('.boxFormSearchAdvance').hasClass("col-md-6");
        if(openPanelControl){

            jQuery("#loadingSelectTotal").show();

            jQuery('.boxFormSearchAdvance').removeClass("col-md-6");
            jQuery('.boxFormSearchAdvance').addClass("noneClassImportant");

            jQuery('.boxDetailsClass').removeClass("col-md-6");
            jQuery('.boxDetailsClass').addClass("col-md-12");

            jQuery('#details').removeClass("col-md-8");
            jQuery('#details').addClass("col-md-4");


            jQuery('#details-button-settings').removeClass("visible-custom");
            jQuery('#details-button-settings').addClass("invisible-custom");

            setTimeout(function(){jQuery("#loadingSelectTotal").hide();},500);


        }else {
            jQuery("#loadingSelectTotal").show();
            jQuery('.boxFormSearchAdvance').addClass("col-md-6");
            jQuery('.boxFormSearchAdvance').removeClass("noneClassImportant");

            jQuery('.boxDetailsClass').removeClass("col-md-12");
            jQuery('.boxDetailsClass').addClass("col-md-6");

            jQuery('#details').removeClass("col-md-4");
            jQuery('#details').addClass("col-md-8");

            jQuery('#details-button-settings').removeClass("invisible-custom");
            jQuery('#details-button-settings').addClass("visible-custom");

            setTimeout(function(){jQuery("#loadingSelectTotal").hide();},500);
        }


    });



    /** ============= CLICK ANTEPRIMA ============= */

    jQuery('#anteprimaBtn').click(function(e) {

        var openPanelControl = !jQuery('#details').hasClass("in");
        if(openPanelControl ||  window.dontClose){

            window.dontClose = false;
            var left = jQuery('#details').width();
            jQuery('#details-button').css("left", left+"px");
            jQuery('#details-button-settings').css("left", left+"px");
            jQuery('#details-button').removeClass("visible-custom");
            jQuery('#details-button').addClass("invisible-custom");

            resolveForm();

        }else{
            setTimeout(function(){
                jQuery('#details-button').css("left", "0");
                jQuery('#details-button-settings').css("left", "0");
                jQuery('#details-button').removeClass("invisible-custom");
                jQuery('#details-button').addClass("visible-custom");
                jQuery('#details').addClass("collapse");
                jQuery('#details').removeClass("in");
            },400);
        }

    });

    jQuery('#details-button').click(function(e) {
        jQuery('#anteprimaBtn').trigger("click");
    });

    jQuery('.more-results').click(function(e) {

        window.controlMoreResult = true;
        var numbers = jQuery('.body-list > .content-list-result > .result-in-box-list').length;

        startIndex = numbers + 1;

        resolveForm();
    });

    function showMore() {
        jQuery('.more-results > .message').show();
        jQuery('.more-results > .message-loading').hide();
    }

    function hideMore() {
        jQuery('.more-results > .message').hide();
        jQuery('.more-results > .message-loading').show();
    }



    //support function str
    function supportChangeStr(id,checked,value,separator,type){
        var str = jQuery(id)[0].value;
        var array = null;
        if(type == 1){
            if(!window.arrayStr1) window.arrayStr1 = [];
            array = window.arrayStr1;
        }else if(type == 2){
            if(!window.arrayStr2) window.arrayStr2 = [];
            array = window.arrayStr2;
        }else if(type == 3){
            if(!window.arrayStr3) window.arrayStr3 = [];
            array = window.arrayStr3;
        }else if(type == 4){
            if(!window.arrayStr4) window.arrayStr4 = [];
            array = window.arrayStr4;
        }else{
            if(!window.arrayStr5) window.arrayStr5 = [];
            array = window.arrayStr5;
        }

        if(checked){
            if(type == 1){
                window.arrayStr1.push(value);
            }else if(type == 2){
                window.arrayStr2.push(value);
            }else if(type == 3){
                window.arrayStr3.push(value);
            }else if(type == 4){
                window.arrayStr4.push(value);
            }else{
                window.arrayStr5.push(value);
            }

        }else{

            for (var i = 0; i < array.length; i++){
                if (window.arrayStr1 && window.arrayStr1[i] === value) {
                    window.arrayStr1.splice(i, 1);
                    break;
                }

                if (window.arrayStr2 && window.arrayStr2[i] === value) {
                    window.arrayStr2.splice(i, 1);
                    break;
                }

                if (window.arrayStr3 && window.arrayStr3[i] === value) {
                    window.arrayStr3.splice(i, 1);
                    break;
                }

                if (window.arrayStr4 && window.arrayStr4[i] === value) {
                    window.arrayStr4.splice(i, 1);
                    break;
                }

                if (window.arrayStr5 && window.arrayStr5[i] === value) {
                    window.arrayStr5.splice(i, 1);
                    break;
                }
            }

        }

        if(type == 1){
            jQuery(id)[0].value = window.arrayStr1.join(separator);
        }else if(type == 2){
            jQuery(id)[0].value = window.arrayStr2.join(separator);
        }else if(type == 3){
            jQuery(id)[0].value = window.arrayStr3.join(separator);
        }else if(type == 4){
            jQuery(id)[0].value = window.arrayStr4.join(separator);
        }else{
            jQuery(id)[0].value = window.arrayStr5.join(separator);
        }


    }

    //calc height body-list
    function calcHeightBodyList(){

        var numbers = jQuery('.body-list > .content-list-result > .result-in-box-list').length;
        jQuery('#panel-details-list > .header-list').html("<?= JText::_('ADVSEARCH_RESULTS_FOUND') ?>: "+numbers+" di "+window.totalResults);
        if(numbers == window.totalResults){
            jQuery(".more-results").hide();
        }else{
            jQuery(".more-results").show();
        }


        var height = jQuery('#details')[0].offsetHeight;
        height -= jQuery('#panel-details-filter')[0].offsetHeight + jQuery('#panel-details-list > .header-list')[0].offsetHeight;
        jQuery('.body-list').css("height", height+"px");

        jQuery(".loadingDetails").fadeOut(1000);
    }

    function createElementList(title,text,obj){

        var buttonZoom = jQuery("<i class='fa fa-search-plus' data-geometry='"+JSON.stringify(obj)+"'></i>");
        var titleDiv = jQuery('<h1>', {text : title});
        var textDiv = jQuery('<p>', {text : text});
        var boxDiv = jQuery('<div>', {"class":"result-in-box-list", "data-geometry":JSON.stringify(obj)});

        titleDiv.append(buttonZoom);
        boxDiv.append(titleDiv);
        boxDiv.append(textDiv);

        jQuery( boxDiv).hover(
            function() {
                window.functionMap.addGraphicTemp(obj);
            }, function() {
                window.functionMap.removeGraphicTemp();
            }
        );

        jQuery(buttonZoom).click(function(){
            var geom = JSON.parse(this.getAttribute("data-geometry"));
            window.functionMap.goInExtent(geom);
        });


        jQuery(".content-list-result").append(boxDiv);

    }

    function getTitleCustom(title,key){
        var arrayKey = ["text_free_search","keywords","PriorityDataset","OpenDataTheme","OpenData","inspireThemes","services","admin_resp","date","type","bbox","category"];
        var arrayLabel= ["Testo libero","Parola chiave","Dataset prioritari","Temi open data","Open Data","Tema INSPIRE","Tipo servizio","Responsabile","Quando","Profilo","Dove","Categoria ISO",
            "Anytext","Keywords","Priority dataset","Open data themes","Open Data","INSPIRE themes","Service type","Responsible","When","Profile","Where","Topic category"];

        var getKey = null;

        for(var i = 0; i < arrayLabel.length; i++){
            if(arrayLabel[i] == title){
                getKey = arrayKey[i%12];
                break;
            }
        }

        var saveObjSearchText = JSON.parse(readCookie("saveObjSearchText"));
        var saveCompositeStr = JSON.parse(readCookie("saveCompositeStr"));

        var value_found = eval("saveObjSearchText."+getKey);
        if(!value_found) value_found = eval("saveCompositeStr."+getKey);

        return value_found;
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

    function createElementListFilter(title,key){

        var countCustom = jQuery( "#filters-box-deatils > li" )
            .filter(function( index ) {
                return jQuery( this ).attr( "data-title" ) === title;
            }).length;

        var titleCustom = getTitleCustom(title,key);
        if(countCustom == 0){
            var textDiv = jQuery('<i>', {"class" : "fa fa-times removeFilter","data-key": key, "data-title": title}).click(function () {
                var option = jQuery(this)[0];
                var key = option.attributes['data-key'].value;
                var title = option.attributes['data-title'].value;
                var arraySup = key.split(",");

                jQuery.each(arraySup, function (i, item) {
                    jQuery.each(jQuery('[name='+item+']'), function (i, item) {
                        if(item.type == "text" || item.type == "date" || item.type == "hidden")
                            item.value = "";
                        if(item.type == "select" || item.type == "select-one") jQuery(this).val("-1");
                        if(item.type == "radio" || item.type == "checkbox"){
                            if(item.name == "selection-search" && item.value != "dati"){
                                jQuery("#box-dati").hide();
                                jQuery("#selection-search-tema-inspire").hide();
                                jQuery("#inspireThemes-checkbox")[0].value = "";
                                jQuery("#tema_pdataset-checkbox-prioritydataset")[0].value = "";
                                jQuery("#tema_pdataset-checkbox-opendata")[0].value = "";
                                jQuery("#tema_iso-checkbox")[0].value = "";
                                jQuery("input[name=inspireThemes-checkbox]").removeAttr('checked');
                                jQuery("input[name=tema_pdataset-checkbox-prioritydataset]").removeAttr('checked');
                                jQuery("input[name=tema_pdataset-checkbox-opendata]").removeAttr('checked');
                                jQuery("input[name=tema_iso-checkbox]").removeAttr('checked');
                                jQuery("input[name=OpenData]").value = "";
                                jQuery("#selection_search_all")[0].checked = true;
                            }

                            if(item.name == "selection-search" && item.value != "servizi"){
                                jQuery("#selection-search-servizio").hide();
                                jQuery("#services-checkbox")[0].value = "";
                                jQuery("input[name=services-checkbox]").removeAttr('checked');
                                jQuery("#selection_search_all")[0].checked = true;
                            }
                            item.checked = false;
                        }

                        if(item.name == "tema-iso"){
                            jQuery("input[name=tema_iso-checkbox]").removeAttr('checked');
                        }
                    });

                });

                jQuery.each(jQuery("#filters-box-deatils > li"), function (i, item) {
                    if(title == item.attributes['data-title'].outerText){
                        item.remove();
                    }
                });


                resolveForm();

            });
            var boxDiv = jQuery('<li>', {text : title + " ", "data-title": title,"title":titleCustom});

            boxDiv.append(textDiv);
			
            jQuery("#filters-box-deatils").append(boxDiv);
        }


    }

    function generateDefineUrl(urlGeoportal,params) {

        var count = 1;
        for(var item in params){
            urlGeoportal += count++ <= 1 ? "?" : "&";
            urlGeoportal += item + "=" + params[item];
        }
        return urlGeoportal;
    }

    function addFilter(serialize) {

        jQuery("#filters-box-deatils").empty();

        var objFound = {};
        var arraySup = serialize.split("&");
        jQuery.each(arraySup, function (i, item) {
            var supValue = item.split("=");
            var key = supValue[0];
            var value = supValue[1];
            if(value && value != -1){
                for(var objMatch in objSearch){
                    if(objSearch[objMatch] != 1 && objSearch[objMatch].indexOf(key) != -1){
                        if(objMatch == 'Profilo' || objMatch == 'Profile'){
                            if(jQuery('input[name=selection-search]:checked').val() == "all") continue;
                        }
                        objFound[objMatch] = 1;
                    }
                }
            }
        });

        for(var objMatch in objFound){
            if(debug) console.log("aggiungo filtro: "+objMatch);

            /* Bug 172
             * quando si passa da dati a servizi e c'è un tema INSPIRE attivo, questo non viene resettato
             *
             * FIX:
             * si aggiungono i filtri INSPIRE solo nel caso di Dati
             * @author paolo martufi 2017-07-04
             */
            if(objMatch == "Tema INSPIRE" || objMatch == "INSPIRE Theme" && (objFound['Profilo'] || objFound['Profile'])){
                if( jQuery('input[name=selection-search]:checked').val() == "dati")
                    createElementListFilter(objMatch,objSearch[objMatch]);
            } else if(objMatch == "Categoria ISO" || objMatch == "Topic category" && (objFound['Profilo'] || objFound['Profile'])){
                if( jQuery('input[name=selection-search]:checked').val() == "dati" )
                    createElementListFilter(objMatch,objSearch[objMatch]);
            } else if(objMatch == "Dataset prioritari" || objMatch == "Priority dataset" && (objFound['Profilo'] || objFound['Profile'])){
                if( jQuery('input[name=selection-search]:checked').val() == "dati" )
                    createElementListFilter(objMatch,objSearch[objMatch]);
            } else if(objMatch == "Temi open data" || objMatch == "Open data Theme" && (objFound['Profilo'] || objFound['Profile'])){
                if( jQuery('input[name=selection-search]:checked').val() == "dati" ){
					createElementListFilter(objMatch,objSearch[objMatch]);
				}                
            } else if(objMatch == "Open Data" || objMatch == "Open Data" && (objFound['Profilo'] || objFound['Profile'])){
                if( jQuery('input[name=selection-search]:checked').val() == "dati" ){
					createElementListFilter(objMatch,objSearch[objMatch]);
				}  
            } else if(objMatch == "Tipo Servizio" || objMatch == "Service type" && (objFound['Profilo'] || objFound['Profile'])){
                if( jQuery('input[name=selection-search]:checked').val() == "servizi" )
                    createElementListFilter(objMatch,objSearch[objMatch]);
            } else{
                createElementListFilter(objMatch,objSearch[objMatch]);
            }
        }


    }

    function replaceText(text,control) {
        if(control == "all"){
            return removePlus(text).replace(new RegExp(escapeRegExp(" "), 'g'), " AND ");
        }else{//control == "one"
            return removePlus(text).replace(new RegExp(escapeRegExp(" "), 'g'), " OR ");
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
	
	function removeOtherArray(str){
		return str.replace(new RegExp(escapeRegExp(']"+OR+"['), 'g'), ',');
	}

    function removeSpace(str) {
        return str.replace(new RegExp(escapeRegExp(' '), 'g'), '+');
    }

    function removeSpaceCod(str) {
        str = str.replace(new RegExp(escapeRegExp(' '), 'g'), '%2B');
        return str.replace(new RegExp(escapeRegExp('+'), 'g'), '%2B');
    }

    function addSpaceAndReplace(str) {
        str =  str.replace(new RegExp(escapeRegExp('+'), 'g'), ' ');
        return str.replace(new RegExp(escapeRegExp(','), 'g'), '" OR "');
    }

    function adaptSerialize(se){
        var r,t,b,i,a,be,ct,o,ss;
        var saveObjSearchText = {};
        var saveCompositeStr = {};
        var Fskis = searchKeyInSerialize;

        //http://192.168.1.58:8080/geoportalRNDT/rest/index/stats
        //searchText
        var searchTextSup = [];
        r = Fskis(se, "filter-search");
        if(r) r+=":"; else r = "";
        t = Fskis(se, "text-free");
        if(t) t = jQuery.grep(t.split("+"), function(value2) {return value2 != "";}).join("+");
        ct = Fskis(se, "text-free-radio");

        if(ct == "text" && t && t != null){
            searchTextSup.push(jQuery("#text_free_search")[0].value);
            saveObjSearchText.text_free_search = jQuery("#text_free_search")[0].value;
        }else{
            if(t && t != null){
                var controlSPlit = t.split("+");
                if(controlSPlit.length == 1){
                    searchTextSup.push(r+replaceText(t,ct));
                    saveObjSearchText.text_free_search = r+replaceText(t,ct);
                }else{
                    searchTextSup.push(r+"("+replaceText(t,ct)+")");
                    saveObjSearchText.text_free_search = r+"("+replaceText(t,ct)+")";
                }
            }
        }


        r = Fskis(se, "keywords");
        //if(r) searchTextSup.push('keywords:("'+removeSpace(r)+'")');
        if(r){
            searchTextSup.push('keywords:("'+addSpaceAndReplace(r)+'")');
            saveObjSearchText.keywords = 'keywords:("'+addSpaceAndReplace(r)+'")';
        }

        /* Bug 172
         * quando si passa da dati a servizi e c'è un tema INSPIRE attivo, questo non viene resettato
         *
         * FIX:
         * si valutano i valori dei Temi INSPIRE, solo se è selection-search = dati
         * @author paolo martufi 2017-07-04
         */
        if(jQuery('input[name=selection-search]:checked').val() == "dati") {
            r = Fskis(se, "inspireThemes");
            if (r && r != ""){
                searchTextSup.push('INSPIRETheme:("' + removePlus(r) + '")');
                saveObjSearchText.inspireThemes = 'INSPIRETheme:("' + removePlus(r) + '")';
            }
     
            r = Fskis(se, "tema-pdataset-prioritydataset");
            if (r && r != ""){
                searchTextSup.push('PriorityDataset:("' + removePlus(JSON.parse(removeOtherArray(r)).join('" OR "')) + '")');
                saveObjSearchText.PriorityDataset = 'PriorityDataset:("' + removePlus(JSON.parse(removeOtherArray(r)).join('" OR "')) + '")';
            }
    
            r = Fskis(se, "tema-pdataset-opendata");
            if (r && r != ""){
                searchTextSup.push('OpenDataTheme:("' + removePlus(JSON.parse(removeOtherArray(r)).join('" OR "')) + '")');
                saveObjSearchText.OpenDataTheme = 'OpenDataTheme:("' + removePlus(JSON.parse(removeOtherArray(r)).join('" OR "')) + '")';
            }
			
			if(jQuery("#tema_pdataset-checkbox-opendata_control")[0].value === "1"){
				searchTextSup.push('OpenData:("true")');
				saveObjSearchText.OpenData = 'OpenData:("true")';
			}
        }

        if(jQuery("#selection-search-servizio").is(':visible')){
            r = Fskis(se, "services");
            if(r){
                searchTextSup.push("apiso.ServiceType:("+removePlus(r)+")");
                saveObjSearchText.services = "apiso.ServiceType:("+removePlus(r)+")";
            }
        }


        r = Fskis(se, "admin-resp");
        if(r){
            searchTextSup.push('apiso.DataOrganizationName:"'+removePlus(r)+'"');
            saveObjSearchText.admin_resp = 'apiso.DataOrganizationName:"'+removePlus(r)+'"';
        }

        r = Fskis(se, "specialist-date");
        a = Fskis(se, "data-da");//after
        be = Fskis(se, "data-a");//before
        if(r && (a || be)){
            if (!a) a = '1900-01-01';
            if (!be) be = '2100-12-31';

            if(jQuery("input[name=specialist-date_search]").is(':checked')){
                var strSupp = "(";

                if(r == "apiso.CreationDate"){
                    strSupp += "apiso.CreationDate:["+a+" TO "+be+"]";
                }else{
                    strSupp += "apiso.CreationDate:[1900-01-01 TO 2100-12-31]";
                }
                if(r == "apiso.PublicationDate"){
                    strSupp += " AND apiso.PublicationDate:["+a+" TO "+be+"]";
                }else{
                    strSupp += " AND apiso.PublicationDate:[1900-01-01 TO 2100-12-31]";
                }
                if(r == "apiso.RevisionDate"){
                    strSupp += " AND apiso.RevisionDate:["+a+" TO "+be+"]";
                }else{
                    strSupp += " AND apiso.RevisionDate:[1900-01-01 TO 2100-12-31]";
                }

                strSupp += ")";

                searchTextSup.push(strSupp);
                saveObjSearchText.date = strSupp;

                //apiso.CreationDate[1900-01-01 TO 2100-12-31] OR apiso.ModificationDate[1900-01-01 TO 2100-12-31] OR apiso.RevisionDate[2015-01-01 TO 2017-11-30]
            }else{
                searchTextSup.push(r+":["+a+" TO "+be+"]");
                saveObjSearchText.date = r+":["+a+" TO "+be+"]";
            }

        }
        if(jQuery('input[name=selection-search]:checked').val() == "dati"){
            var str = "";

            var countSearch = 0;
            if(jQuery('input[name=dati_dataset]').is(':checked')){
                countSearch++;
                str+= "dataset";
            }
            if(jQuery('input[name=dati_series]').is(':checked')){
                if(countSearch == 1) str+=" OR ";
                str+= "series";
            }

            str = "apiso.Type:("+str+")";
            searchTextSup.push(str);
            saveObjSearchText.type = str;
        }else if (jQuery('input[name=selection-search]:checked').val() == "servizi"){
            searchTextSup.push("(apiso.Type:service)");
            saveObjSearchText.type = "(apiso.Type:service)";
        }

        //bbox
        b = Fskis(se, "extent");
        //if(!b) b = "-180,-90,180,90";

        //spatialRel
        ss = Fskis(se, "spatialRel");

        //dataCategory
        i = Fskis(se, "tema-iso");
        if(i) i = replaceAll(i,'"',"");

        var compositeStr = [];

        if(searchTextSup.length != 0){
            var sm = searchTextSup[0].startsWith("(") ? "* AND " : "";//aggiungi ' o no

            compositeStr.push("searchText="+sm+searchTextSup.join(" AND "));

        }

        if(b){
            compositeStr.push('bbox='+removePlus(b));
            saveCompositeStr.bbox = 'bbox='+removePlus(b);
            if(jQuery('input[name=regione-selected]')[0].value != "") saveCompositeStr.regioneSelected = jQuery('input[name=regione-selected]')[0].value;
            if(jQuery('input[name=provincia-selected]')[0].value != "") saveCompositeStr.provinciaSelected = jQuery('input[name=provincia-selected]')[0].value;
            if(jQuery('input[name=comune-selected]')[0].value != "") saveCompositeStr.comuneSelected = jQuery('input[name=comune-selected]')[0].value;

            //compositeStr.push('bboxSR='+window.functionMap.map.spatialReference.wkid);
        }

        if(i){
            compositeStr.push('dataCategory='+i);
            saveCompositeStr.category = 'dataCategory='+i;
        }

        //if(a) compositeStr.push('after='+a);
        //if(be) compositeStr.push('before='+be);

        //before
        o = Fskis(se, "order");
        if(o){
            compositeStr.push('orderBy='+o);
            saveCompositeStr.orderBy = 'orderBy='+o;
        }
        if(ss){
            compositeStr.push('spatialRel='+ss);
            saveCompositeStr.spatialRel = 'spatialRel='+ss;
        }


        document.cookie =  "saveObjSearchText=" + JSON.stringify(saveObjSearchText) + ";" + (24*60*60) + ";path=/";
        document.cookie =  "saveCompositeStr=" + JSON.stringify(saveCompositeStr) + ";" + (24*60*60) + ";path=/";
//alert(compositeStr.join("&"));
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
                found =  decodeURIComponent(value);
            }
        });
        return found;
    }

    function createObjUrl() {

        var urlGeoportal = pathFolder+"/services-advancedSearch.php";

        var serialize = jQuery("#form-advance-search").serialize();

        var params = {
            start: startIndex,
            max: itemsPerPage,
            geometryType: "esriGeometryBox",
        };

        var adapt = adaptSerialize(serialize);
        adapt = adapt ? "&" + adapt : "";

        var cookie = generateDefineUrl("",params) +"&"+ serialize + "&f=json";
        var paramsCrip = generateDefineUrl("<?php echo GPT_REST_URL_SERVER;?>",params) + adapt + "&f=json";

        if(debug) console.log(generateDefineUrl("<?php echo GPT_REST_URL_SERVER;?>",params) + adapt + "&f=pjson");
        var proxy= true;

        if(proxy){
            var str = {GPT_REST_URL_SERVER:encodeURIComponent(paramsCrip),url:"<?php echo GPT_REST_URL_SERVER;?>"};
            obj = {
                type: "POST",
                url: urlGeoportal,
                data: str
            };
        }else{
            obj = {
                type: "GET",
                url: paramsCrip
            };
        }

        obj.serialize = serialize;
        //var jsonObj = JSON.stringify(obj);
        var d = new Date();
        d.setTime(d.getTime() + (1*24*60*60*1000));
        var expires = "expires="+ d.toUTCString();
        //document.cookie =  "datiRicerca=" + jsonObj + ";" + expires + ";path=/";
        document.cookie =  "datiRicerca=" + cookie.substring(1) + ";" + expires + ";path=/";
        document.cookie =  "datiRicercaUrl=" + paramsCrip + ";" + expires + ";path=/";
    }


    function resolveForm() {

        if(!window.functionMap.map.spatialReference.wkid) return;

        if(!window.controlMoreResult) jQuery(".loadingDetails").show();
        hideMore();

        createObjUrl();

        var serialize = jQuery("#form-advance-search").serialize();

        addFilter(serialize);
        //console.log(serialize);
        if(!window.controlMoreResult) jQuery(".content-list-result").empty();

        if(debug) console.log(obj);

        jQuery.ajax(obj).done(function(json) {
            window.totalResults = 0;
            if(json != null && json != "") {
                var data = json;
                var arraySup = data.records;
                window.linkExportQuery = data.urlSend.replace("<?php echo GPT_BASE_URL_SERVER;?>", "<?php echo GPT_BASE_URL?>").replace(":80","");
                window.totalResults = data.totalResults;
                if (arraySup.length != 0) {

                    if(!window.controlMoreResult) window.functionMap.clearMap();

                    jQuery.each(arraySup, function (i, item) {
                        var obj = {geometry: window.functionMap.riGenerateGeometryByJson(item['geometry'])};

                        window.controlGraphic = true;
                        //window.functionMap.controlGraphicAjax = true;
                        window.functionMap.addGraphic(obj,true);

                        createElementList(item["title"], item["summary"],obj);
                    });
                    window.controlMoreResult = false;
                    window.controlGraphic = false;
                }
            }

            if(!window.controlMoreResult) jQuery(".loadingDetails").fadeOut(1000);
            showMore();
            calcHeightBodyList();
        });


    }


    jQuery( "#id_pa_search_text" ).focusout(function() {
        unfocusResultPA();
    });

    function unfocusResultPA() {
        setTimeout(function(){
            jQuery("#livesearch").empty();
            jQuery('#livesearch').hide();
        },300);

    }

    function showResult(str) {
        if (str.length>=3) {
            jQuery("#livesearch").empty();

            jQuery.get( "<?php echo $urlAllPA;?>?nome="+str, function( data ) {
                var dataParse = JSON.parse(data);
                var arraySup = [];
                if(dataParse.length != 0){
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
                                jQuery('[name=admin-resp]')[0].value = title;
                            });

                            jQuery("#livesearch").append(textDiv);
                        }
                    });
                }else{
                    jQuery("#livesearch").html('<?= JText::_('ADVSEARCH_NO_RESULTS') ?>');
                }


                jQuery('#livesearch').show();
                if(debug) console.log(arraySup);

            });
        }
    }


	function saveAllInputCheck(){
		var allItem = jQuery("input[type='checkbox']");
		var arrayCheckBox = [];
		for(var i=0;i<allItem.length;i++){
			var item = allItem[i];
			arrayCheckBox.push(item.checked);
			
		}
		
		localStorage.setItem("saveCheckBox",JSON.stringify(arrayCheckBox));
		
		var allItem = jQuery("input[type='radio']");
		var arrayRadio = [];
		for(var i=0;i<allItem.length;i++){
			var item = allItem[i];
			arrayRadio.push(item.checked);
			
		}
		
		localStorage.setItem("saveRadio",JSON.stringify(arrayRadio));
	}
	
	function recoverAllInput(){
		if(localStorage.getItem("saveCheckBox")){
			var arrayCheck = JSON.parse(localStorage.getItem("saveCheckBox"));
			var allItem = jQuery("input[type='checkbox']");
			for(var i=0;i<allItem.length;i++){
				var item = allItem[i];
				item.checked = arrayCheck[i]
				
			}
		
		}
		
		if(localStorage.getItem("saveRadio")){
			var arrayRadio = JSON.parse(localStorage.getItem("saveRadio"));
			var allItem = jQuery("input[type='radio']");
			for(var i=0;i<allItem.length;i++){
				var item = allItem[i];
				item.checked = arrayRadio[i]
				
			}
		
		}
		
		localStorage.removeItem("saveCheckBox");
		localStorage.removeItem("saveRadio");
	}
	
	
	recoverAllInput();

	
</script>

<style>

    #livesearch{
        display: none;
        z-index: 10;
        background: #f2f2f2;
        height: auto;
        position: absolute;
        width: calc(100% - 30px);
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

    #selection-search-tema-inspire, #selection-search-servizio, #box-dati, .ifRadioSelect{
        display: none;
    }

    #map{
        height: 600px;
        display: block;

    }

    .boxButton{
        padding-top: 7px;
        border-top: 1px solid #ddd;
    }

    .box-form{
        height: 540px;
        overflow-y: scroll;
        display: block;
    }

    .boxContainerSearchAdvance{
        overflow: hidden;
        position: relative;
    }

    .noPadding{
        padding: 0;
    }

    .checkbox-ul{
        list-style: none;
    }

    .checkbox-ul >li{
        display: inline-block;
        width: auto;
        padding: 0 15px;
        vertical-align: top;
    }

    .block-label{
        display: inline-block;
        padding: 0 5px;
    }

    .box-checkbox{
        padding-left: 30px;

    }

    .box-form > .row{
        padding: 20px 0;
        border-top: 1px solid #ddd;
    }

    .box-form h3{
        font-size: 1em;
        margin: 0 0 10px;
    }

    .text-left{
        text-align: left;
        text-transform: none;
        color: #999;
        font-size: 0.9em;
    }

    .menuInspire label{
        padding: 10px 0;
    }

    .menuInspire label input{
        margin-right: 10px;
    }

    label{
        font-size: 0.9em;
    }

    .boxContainerSearchAdvance .caret {
        /* margin-top: -6px; */
        height: 0px;
        display: block;
        width: 10px;
        position: absolute;
        right: 14px;
        top: 14px;
    }

    .btn-customform {
        border: 1px solid #ccc;
        position: relative;
    }

    #info{
        max-width: 200px;
        margin: auto;
    }

    .tab-content{
        /*height: 100px;*/
        padding: 15px 0;
    }

    /* GXE CSS */

    #menuDove{
        border: none;
    }

    #menuDove > li{
        border: none;
        outline: none;
		z-index:1;
    }
    #menuDove > li a{
        background: #fff;
        color: black!important;
        text-transform: inherit;
        font-weight: normal;
        border:none;
    }

    #menuDove.disabled > .active > a {
        border-bottom:3px solid #eeeeee;
        font-weight: bold !important;
    }

    #menuDove.disabled > li a{
        background: #fff;
        color: #eeeeee !important;
        text-transform: inherit;
        font-weight: normal;
        border:none;
        cursor: not-allowed;
    }

    #menuDove > .active > a {
        border-bottom:3px solid #005247;
        font-weight: bold !important;
    }

    #map_zoom_slider{
        display: none;
    }

    #details{
        position: absolute;
        height: 100%!important;
        background: #fff;
        z-index: 2;
        padding: 0;
    }

    .invisible-custom .fa-times,
    .invisible-custom .fa-eye,
    .invisible-custom .details-custom,
    .visible-custom .details-setting{
        display: none;
    }

    .visible-custom .fa-eye-slash, .visible-custom .fa-filter{
        display: none;
    }

    #details-button{
        position: absolute;
        z-index: 1;
        background: #007e6d;
        color: #fff;
        cursor: pointer;
        padding: 15px;
    }

    #details-button-settings{
        position: absolute;
        top:55px;
        z-index: 1;
        background: #007e6d;
        color: #fff;
        cursor: pointer;
        padding: 15px;
    }

    #panel-details-filter{
        background: #F5F5F0;
        padding: 15px 30px;
        position: relative;
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

    #panel-details-list{position:relative;}
    #panel-details-list > .header-list{
        padding: 15px;
        border-bottom: 1px solid #ddd;
    }
    #panel-details-list > .body-list{
        /*max-height:450px;*/
    }
    #panel-details-list > .body-list{
        overflow-y: auto;
        display: block;
        height: 430px;
    }


    .result-in-box-list{
        padding: 15px;
        border-bottom: 1px solid #ddd;
    }
    .result-in-box-list > h1{
        text-transform: uppercase;
        font-size: 1em;
        margin: 5px 0;
    }
    .result-in-box-list > p{
        margin: 0;
        color: #5a5a5a;
        font-size: 0.95em;
    }

    .more-results{
        padding: 15px;
        text-align: center;
        color: #007e6d;
        font-weight: bold;
        cursor: pointer;
    }

    .more-results:hover{
        text-decoration: underline;
    }

    .message-loading{
        display: none;
    }

    .loadingDetails{
        position: absolute;
        background: #ddd;
        width: 100%;
        height: 100%;
        z-index: 1;
        text-align: center;
        padding-top: 30px;
    }


    #loadingSelect{
        display: none;
        background: #ddd;
        position: absolute;
        width: 100%;
        height: 100%;
        z-index: 3;
        text-align: center;
        padding-top: 30px;
        top: 30px;
        left: 15px;
    }

    #panel-details-filter > div{
        display: inline-block;
        top: 40%;
        position: absolute;
    }

    .btn-customform{
        border: 1px solid #ccc;
    }

    .customUlRadio >li{
        padding: 0;
        padding-right: 15px;
    }

    .noneClassImportant{
        display: none!important;
    }

    .form-group,.customUlRadio{
        margin: 0;
    }

    .form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
        background-color: #eee!important;
        opacity: 1;
    }

    .margin15{
        margin: 15px 0;
    }

    .fa-filter{
        background:url('<?php echo $baseurls."/images/icons/filter.png";?>');
        color: #007e6d;
        font-size: 0px!important;
        background-size: cover;
        background-position: 19px;
        height: 20px;
        width: 20px;
        line-height: 30px;
    }

    #details-button-settings > .fa-times{
        background:url('<?php echo $baseurls."/images/icons/nofilter.png";?>');
        color: #007e6d;
        font-size: 0px!important;
        background-size: cover;
        background-position: 19px;
        height: 20px;
        width: 20px;
        line-height: 30px;
    }

    .cursorCustom,.cursorCustom #map_gc{
        cursor: crosshair!important;
    }

    .link-export-query{
        position: absolute;
        top: 10px;
        right: 20px;
        border: 2px solid #007e6d;
    }

    .link-export-query > a{
        padding: 3px 5px;
        display: block;
    }

    .btn-CustomSelect{
        background-color: white!important;
        border-radius: 0!important;
        display: block;
        width: 100%;
        height: 34px;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555;
        background-color: #fff;
        background-image: none;
        border: 1px solid #ccc;
        border-radius: 4px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
        -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        text-transform: none;
    }

    .btn-CustomSelect:hover{
        text-decoration:none;
    }
    .bootstrap-select.disabled{
        background-color: #eee!important;
        opacity: 1;
    }
    .overMapColor{
        background: yellow;
    }

    #details-button-layerList{
        position: absolute;
        top: 0px;
        z-index: 1;
        background: #007e6d;
        color: #fff;
        cursor: pointer;
        padding: 15px;
        right: 0px;
    }

    #details-button-layerList.open {
        background: #026154;
    }

    #layerlistContent {
        position: absolute;
        top: 55px;
        right: 0px;
        height: 300px;
        width: 300px;
        z-index: 3;
    }

    .result-in-box-list>h1>i.fa.fa-search-plus {
        float: left;
        cursor: pointer;
        color: #007e6d;
        padding-right: 5px;
        font-size: 17px;
        line-height: 20px;
    }



</style>
