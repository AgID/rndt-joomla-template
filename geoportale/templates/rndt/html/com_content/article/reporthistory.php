<?php

$lang = JFactory::getLanguage();
$lang_code = substr($lang->getTag(), 0,2);


/**
Dato che l'URL della pagina dell'history è creato direttamente nel geoportal (parametro in gpt.xml),
non è possibile averne uno diverso a seconda della lingua, qunidi bisogna che qui venga fatta una distinzione
a seconda del valore del cookie.
**/

if($_COOKIE["geoportalLocale"] != $lang_code) header("location: ".JUri::base()."eng/manage-and-publish/harvesting?harvestids=".$_GET['harvestids']);


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
    return $json;
}

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

require_once JPATH_BASE . '/includes/functions.php';

$input = JFactory::getApplication()->input;
$id = $input->getInt('id'); //get the article ID
$article = JTable::getInstance('content');
$article->load($id);


/** ============= get informations ============= */

$parameter = $_GET['harvestids'];//"{FD3DF767-ED42-493E-9BF0-6387B7B03D88}";//
$parameter = urlencode($parameter);
if(!empty($parameter)){
    $url = GPT_BASE_URL_SERVER."/rest/usage/harvester/history?uuids=".$parameter;
    $history = getByURL($url);

    $arrayList = $history['harvester']['databaseInfo']['GPT_HARVESTING_HISTORY']['rows'];

    $params = $history['harvester']['databaseInfo'];

}

?>

<div class="container top20 paddingCustom">
    <div class="row">
        <div class="col-md-12">
            <h2 class="subtitle_custom"><?= JHtml::_('content.prepare', '{loadmodule breadcrumbs}') ?></h2>
            <h1 class="title_custom"><?= $article->get('title') ?></h1>
		
            <div class="container-fluid">
                <?php if(empty($parameter)):?>
                    <?= JText::_('PARAMETER_ERROR') ?>
                <?php endif;?>
            </div>


			<div class="col-md-12">
				<h3 class="titleCustomInfo"><?= JText::_('CATALOG_NAME') ?></h3>
				<p><?php echo $params['title'];?></p>
			</div>
			<div class="col-md-12">
				<h3 class="titleCustomInfo"><?= JText::_('CATALOG_UUID') ?></h3>
				<p>
					<?php echo $params['uuidCatalogo'];?>
				</p>
			</div>
			<div class="col-md-12">
				<h3 class="titleCustomInfo"><?= JText::_('CATALOG_URL') ?></h3>
				<p>
					<a href="<?php echo $params['sourceUri'];?>" target="_blank">
						<?php echo $params['sourceUri'];?>
					</a>
				</p>
			</div>
			<div class="col-md-6">
				<h3 class="titleCustomInfo"><?= JText::_('PROTOCOL_TYPE') ?></h3>
				<p><?php echo strtoupper($params['protocolType']);?></p>
			</div>

        </div>

    </div>
</div>

<?php if(!empty($parameter)):?>

    <!-- Sommario -->
    <div class="container-fluid detailStatBox paddingCustom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="classTableUtente paddIngCustom">
                                    <?= JText::_('REPORT_HISTORY') ?>
                                </div>
                                <table id="tableHistoryCustom" class="table">

                                    <thead>
                                        <tr>
                                            <th class="classTableUtenteUser"><?= JText::_('HARVESTING_ID') ?></th>
                                            <th class="classTableUtenteUser"><?= JText::_('HARVESTING_DATE') ?></th>
                                            <th class="classTableUtenteUser"><?= JText::_('QUERIED') ?></th>
                                            <th class="classTableUtenteUser"><?= JText::_('VALIDATED') ?></th>
                                            <th class="classTableUtenteUser"><?= JText::_('HARVESTED') ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    <?php foreach ($arrayList as $item):?>
                                        <tr>
                                            <td class="collapseHistoryReport">
                                                <a href="<?= JText::_('URL_HARVESTING_REPORT') ?>?uuids=<?php echo urldecode($item['UUID']);?>">
                                                    <?php echo $item['UUID'];?>
                                                </a>
                                            </td>
                                            <td class="collapseHistoryReport"><?php echo $item['HARVEST_DATE'];?></td>
                                            <td class="collapseHistoryReport"><?php echo $item['HARVESTED_COUNT'];?></td>
                                            <td class="collapseHistoryReport"><?php echo $item['VALIDATED_COUNT'];?></td>
                                            <td class="collapseHistoryReport"><?php echo $item['PUBLISHED_COUNT'];?></td>
                                        </tr>

                                    <?php endforeach;?>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<?php endif;?>

<script>
    jQuery(document).ready(function() {
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
    });
</script>