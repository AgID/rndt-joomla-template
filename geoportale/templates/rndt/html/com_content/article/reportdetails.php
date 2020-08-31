<?php

/*
 * Restituisce solo una parte del messaggio d'errore e solo per alcuni errori, filtrando messaggi strani
 * @author paolo martufi 2017-07-04
 */
function customErrorMsg($text){
    $lang = JFactory::getLanguage();
    $lang_code = substr($lang->getTag(), 0,2);
    if($lang_code == "it")
    {
        if( strpos($text, "The document is owned by another user") !== false )
            return str_replace("The document is owned by another user", "Il documento è di proprietà di un altro utente",$text);
        if( strpos($text, "Unrecognized metadata schema") !== false )
            return str_replace("Unrecognized metadata schema", "Schema metadati non riconosciuto", $text);
        return custom_string_max_legth($text);
    }
    elseif($lang_code == "en")
    {
        return custom_string_max_legth($text);
    }
}

function TranslateKey($text,$resize = false){

    $lang = JFactory::getLanguage();
    $lang_code = substr($lang->getTag(), 0,2);

    $arrayTranslate = array(
        "it"=> array(
            "average"=>"durata media",
            "harvestEnd"=>"Data e ora di raccolta (termine)",
            "docsAdded"=>"documenti aggiunti",
            "docsDeleted"=>"documenti cancellati",
            "docsFailed"=>"documenti falliti",
            "docsHarvested"=>"documenti raccolti",
            "docsPublished"=>"documenti pubblicati",
            "docsUpdated"=>"documenti modificati",
            "duration"=>"durata",
            "failed"=>"fallito"
        ),
        "en"=> array(
            "average"=>"average",
            "harvestEnd"=>"harvest end",
            "docsAdded"=>"docs Added",
            "docsDeleted"=>"docs Deleted",
            "docsFailed"=>"docs Failed",
            "docsHarvested"=>"docs Harvested",
            "docsPublished"=>"docs Published",
            "docsUpdated"=>"docs Updated",
            "duration"=>"duration",
            "failed"=>"failed"
        )
    );

    foreach ($arrayTranslate[$lang_code] as $key => $value){
        if($text == $key){
            $text =  $value;
            break;
        }
    }

    //prova con getText

    $textNew = get_text($text);
    if($textNew != $text && !empty($textNew)) return $textNew;
    //if($resize) $text = substr($text,0,3)."...";

    return $text;
}

function getByURL($url, $debug = false){
    if($debug) echo "DEBUG -> ".$url;
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

    $input = iconv('UTF-8', 'UTF-8//IGNORE', utf8_encode($json));

    return $input;
}

function custom_echo($x, $length = 50){
    if(strlen($x)<=$length){
        echo $x;
    }else{
        $y=substr($x,0,$length) . '...';
        echo $y;
    }
}


/*
 * @author paolo martufi 2017-07-03
 */
function custom_string_max_legth($x, $length = 50){
    if(strlen($x)<=$length){
        return $x;
    }else{
        $y=substr($x,0,$length) . '...';
        return $y;
    }
}

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

require_once JPATH_BASE . '/includes/functions.php';

$input = JFactory::getApplication()->input;
$id = $input->getInt('id'); //get the article ID
$article = JTable::getInstance('content');
$article->load($id);


/** ============= get informations ============= */

$parameter = $_GET['uuids'];//"{FD3DF767-ED42-493E-9BF0-6387B7B03D88}";//
$parameter = urlencode($parameter);
if(!empty($parameter)){

    $url = GPT_BASE_URL_SERVER."/rest/usage/harvester/report?uuids=".$parameter;

    //http://192.168.10.58:80/geoportalRNDTAdm/rest/usage/harvester/report?uuids=%7B234201DB-DD36-45A1-8C37-A3F217507421%7D
    $report_json = getByURL($url);
    $report = json_decode($report_json,true);

    $arrayReportSommario = $report['harvester']['metadata']['report'];
    $arrayReportDettaglio = $report['harvester']['metadata']['publishDetails']['record'];



    $arrayReportInfo = array(
        "Uuid"=> $report['harvester']['Uuid'],
        "uuidReport"=> $report['harvester']['uuidReport'],
        "uuidCatalogo"=> $report['harvester']['uuidCatalogo'],
        "protocolType"=> $report['harvester']['protocolType'],
        "reportUuid"=> $report['harvester']['reportUuid'],
        "sourceUri"=> $report['harvester']['sourceUri'],
        "title"=> $report['harvester']['title'],
    );

}



?>
<!--<script type="text/javascript" src="<?php echo $baseurls; ?>js/excel/jquery-3.3.1.min.js"></script>-->
<script type="text/javascript" src="<?php echo $baseurls; ?>js/excel/xlsx.full.min.js"></script>
<script type="text/javascript" src="<?php echo $baseurls; ?>js/excel/FileSaver.min.js"></script>
<!-- INIZIO PAGINA -->
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

        </div>


        <div class="col-md-6">
            <h3 class="titleCustomInfo"><?= JText::_('REPORT_UUID') ?></h3>
            <p><?php echo $arrayReportInfo['uuidReport'];?></p>
        </div>

        <div class="col-md-12">
            <h3 class="titleCustomInfo"><?= JText::_('CATALOG_NAME') ?></h3>
            <p><?php echo $arrayReportInfo['title'];?></p>
        </div>
        <div class="col-md-12">
            <h3 class="titleCustomInfo"><?= JText::_('CATALOG_UUID') ?></h3>
            <p>
                <a href="<?= JText::_('URL_HARVESTING') ?>?harvestids=<?php echo $arrayReportInfo['uuidCatalogo'];?>">
                    <?php echo $arrayReportInfo['uuidCatalogo'];?>
                </a>
            </p>
        </div>
        <div class="col-md-12">
            <h3 class="titleCustomInfo"><?= JText::_('CATALOG_URL') ?></h3>
            <p>
                <a href="<?php echo $arrayReportInfo['sourceUri'];?>" target="_blank">
                    <?php echo $arrayReportInfo['sourceUri'];?>
                </a>
            </p>
        </div>
        <div class="col-md-6">
            <h3 class="titleCustomInfo"><?= JText::_('PROTOCOL_TYPE') ?></h3>
            <p><?php echo strtoupper($arrayReportInfo['protocolType']);?></p>
        </div>
    </div>
</div>

<?php if(!empty($parameter)):?>

    <!-- Sommario -->
    <div class="container-fluid detailStatBox paddingCustom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="tableCustomInfo container-fluid">
                        <div class="row">
                            <div class="col-md-8 classTableUtente"><?= JText::_('SUMMARY') ?></div>
                            <div class="col-md-4 classTableUtente">
                                <button type="button" class="btn btn-customReport" data-toggle="collapse" data-target=".collapseSommario">-</button>
                                <?php if(!empty($arrayReportSommario)):?>
									<select id="exportTo">
										<option value="0"><?= JText::_('DOWNLOAD_REPORT') ?></option>
										<option value="json">JSON</option>
										<option value="xls">XLS</option>
										<option value="csv">CSV</option>
									</select>
                                    <!--<button type="button" id="csvSommarioDownload" class="btn">CSV</button>
                                    <button type="button" id="excelSommarioDownload" class="btn">XLS</button>
                                    <button type="button" id="jsonSommarioDownload" class="btn">JSON Complete</button>-->
                                <?php endif;?>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6 classTableUtenteUser collapseSommario in"><?= JText::_('PARAMETER') ?></div>
                            <div class="col-md-6 col-sm-6 col-xs-6 classTableUtenteUser collapseSommario in"><?= JText::_('VALUE') ?></div>
                            <?php if(!empty($arrayReportSommario)):?>
                               <script>window.csvSommario = "<?= JText::_('PARAMETER') ?>;<?= JText::_('VALUE') ?>\r\n";</script>
                                <?php foreach ($arrayReportSommario as $key => $value):?>
                                    <?php
                                    //control
                                    $arrayNot = array("publish","saveOutput","validate");
                                    if(in_array($key,$arrayNot)) continue;
                                    ?>
                                    <div class="col-md-6 col-sm-6 col-xs-6 collapseSommario in"><?php echo TranslateKey($key);?></div>
                                    <div class="col-md-6 col-sm-6 col-xs-6 collapseSommario in"><?php echo $value;?></div>
                                    <script>window.csvSommario += "<?php echo str_replace('"',"",TranslateKey($key)).";".str_replace('"',"",$value).";";?>\r\n";</script>
                                <?php endforeach;?>
                            <?php endif;?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Dettagli -->
    <div class="container-fluid bgColorCustom reportTable">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="classTableUtente paddIngCustom">
                        <?= JText::_('DETAILS') ?>
                        <?php if(!empty($arrayReportDettaglio)):?>
						<select id="exportTo2">
										<option value="0"><?= JText::_('DOWNLOAD_REPORT') ?></option>
										<option value="xls">XLS</option>
										<option value="csv">CSV</option>
									</select>
                            <!--<button type="button" id="csvDetailsDownload" class="btn">CSV</button>
                            <button type="button" id="excelDetailsDownload" class="btn">XLS</button>-->
                        <?php endif;?>
                    </div>
                    <table id="tableHistoryCustom" class="table">

                        <thead>
                        <tr>
                            <th class="classTableUtenteUser"><?= strtoupper(JText::_('REPORT_UUID')) ?></th>
                            <!--                            <th class="classTableUtenteUser">--><?//= JText::_('VERIFICATION_STATE') ?><!--</th>-->
                            <!--                            <th class="classTableUtenteUser">--><?//= strtoupper(JText::_('DETAILS')) ?><!--</th>-->
                            <th class="classTableUtenteUser"><?= JText::_('VALIDATE_OUTCOME') ?></th>
                            <th class="classTableUtenteUser"><?= strtoupper(JText::_('PUBLISH_OUTCOME')) ?></th>
                        </tr>
                        </thead>
                        <tbody>

                        <?php if(!empty($arrayReportDettaglio)):?>
                            <script>window.csvDetails = "<?= strtoupper(JText::_('REPORT_UUID')) ?>;<?= JText::_('VALIDATE_OUTCOME') ?>;<?= strtoupper(JText::_('PUBLISH_OUTCOME')) ?>;\r\n";</script>
						<?php
						 
						if($arrayReportSommario['docsHarvested'] == 1) $arrayReportDettaglio = array($arrayReportDettaglio);?>
						
						
                        <?php foreach ($arrayReportDettaglio as $item):?>
                            <?php if(!empty($item['validate'])):?>
                                <tr>
                                <td>
                                    <?php if(!$item['validate']['status'] == "failed"):?>
                                        <a href="<?php echo GPT_BASE_URL."/catalog/search/resource/details.page?uuid=".urlencode($item['sourceUri']);?>" target="_blank">
                                            <?php echo $item['sourceUri'];?>
                                        </a>
                                        <script>window.csvDetails+="<?php echo str_replace('"',"",$item['sourceUri'])?>;";</script>
                                    <?php else:?>
                                        <?php echo $item['sourceUri'];?>
                                        <script>window.csvDetails+="<?php echo str_replace('"',"",$item['sourceUri']);?>;";</script>
                                    <?php endif;?>

                                </td>
                                <td class="tableHoverCustom <?php if($item['validate']['status'] =="failed"):?> alert-danger<?php endif;?>">
                                    <?php
                                    /*
                                     * BUG 166
                                     * gestire separatamente gli errori relativi alla validazione e alla pubblicazione
                                     * con output del tipo status_failed: messagge_error, oppure Ok
                                     */
                                    //echo $item['validate']['status'];

                                    /*
                                     * FIX
                                     * @author paolo martufi 2017-07-03
                                     */
                                    $validate_text = $item['validate']['status'] == "failed" && strlen( customErrorMsg($item['validate']['error']) ) > 0
                                        ? TranslateKey($item['validate']['status']) . ": " . customErrorMsg($item['validate']['error'])
                                        : TranslateKey($item['validate']['status']);
                                    echo $validate_text;
                                    ?>
                                    <div class="content_text_custom" <?php if(empty($item['validate']['error'])):?>style="display: none!important"<?php endif;?>>
                                        <?php if(is_array($item['validate']['error'])):?>
											<?php foreach($item['validate']['error'] as $iFor):?>
                                                <?php echo $iFor;?><br>
                                                <script>window.csvDetails+=" <?php echo str_replace('"',"",$iFor);?>";</script>
											<?php endforeach;?>
                                            <script>window.csvDetails+=";";</script>
										<?php else: ?>					
                                            <?php echo $item['validate']['error'];?>
                                            <script>window.csvDetails+="<?php echo $validate_text == "ok" ? $validate_text: str_replace('"',"",$item['validate']['error']);?>;";</script>
										<?php endif; ?>
                                    </div>

                                </td>
                                <td class="tableHoverCustom <?php if($item['publish']['status'] =="failed"):?> alert-danger<?php endif;?>">


                                    <?php
                                    /*
                                     * BUG 166
                                     * gestire separatamente gli errori relativi alla validazione e alla pubblicazione
                                     * con output del tipo status_failed: messagge_error, oppure Ok
                                     */
                                    //echo $item['validate']['status'];

                                    /*
                                     * FIX
                                     * @author paolo martufi 2017-07-03
                                     */
                                    $publish_text  = $item['publish']['status'] == "failed" && strlen( customErrorMsg($item['publish']['error']) ) > 0
                                        ? TranslateKey($item['publish']['status']) . ": " . customErrorMsg($item['publish']['error'])
                                        : TranslateKey($item['publish']['status']);
                                    echo $publish_text;
                                    ?>
                                    <div class="content_text_custom" <?php if(empty($item['publish']['error'])):?>style="display: none!important"<?php endif;?>>
                                        <?php if(is_array($item['publish']['error'])):?>
											<?php foreach($item['publish']['error'] as $iFor):?>
												<?php echo $iFor;?><br>
                                            <script>window.csvDetails+=" <?php echo str_replace('"',"",$iFor);?>";</script>
                                        <?php endforeach;?>
                                            <script>window.csvDetails+=";";</script>
										<?php else: ?>					
											<?php echo $item['publish']['error'];?>
                                            <script>window.csvDetails+="<?php echo $publish_text == "ok" ? $publish_text:  str_replace('"',"",$item['publish']['error']);?>;";</script>
										<?php endif;?>
                                    </div>
                                </td>

                            </tr>
                            <script>window.csvDetails+="\r\n";</script>
                            <?php endif; ?>
                        <?php endforeach;?>
                        <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>



<?php endif;?>

<script>

    function CSVToArray( strData, strDelimiter ) {
        // Check to see if the delimiter is defined. If not,
        // then default to comma.
        strDelimiter = (strDelimiter || ",");

        // Create a regular expression to parse the CSV values.
        var objPattern = new RegExp(
            (
                // Delimiters.
                "(\\" + strDelimiter + "|\\r?\\n|\\r|^)" +

                // Quoted fields.
                "(?:\"([^\"]*(?:\"\"[^\"]*)*)\"|" +

                // Standard fields.
                "([^\"\\" + strDelimiter + "\\r\\n]*))"
            ),
            "gi"
        );


        // Create an array to hold our data. Give the array
        // a default empty first row.
        var arrData = [[]];

        // Create an array to hold our individual pattern
        // matching groups.
        var strMatchedValue = null, strMatchedDelimiter;


        // Keep looping over the regular expression matches
        // until we can no longer find a match.
        var arrMatches = objPattern.exec(strData);
        while ( arrMatches ) {

            // Get the delimiter that was found.
            strMatchedDelimiter = arrMatches[1];

            // Check to see if the given delimiter has a length
            // (is not the start of string) and if it matches
            // field delimiter. If id does not, then we know
            // that this delimiter is a row delimiter.
            if (
                strMatchedDelimiter.length &&
                (strMatchedDelimiter !== strDelimiter)
            ) {

                // Since we have reached a new row of data,
                // add an empty row to our data array.
                arrData.push([]);

            }

            // Now that we have our delimiter out of the way,
            // let's check to see which kind of value we
            // captured (quoted or unquoted).
            strMatchedValue = null;
            if ( arrMatches[2] ) {

                // We found a quoted value. When we capture
                // this value, unescape any double quotes.
                strMatchedValue = arrMatches[2].replace(
                    new RegExp("\"\"", "g"),
                    "\""
                );

            } else {

                // We found a non-quoted value.
                strMatchedValue = arrMatches[3];

            }


            // Now that we have our value string, let's add
            // it to the data array.
            arrData[arrData.length - 1].push(strMatchedValue);

            arrMatches = objPattern.exec(strData);
        }

        // Return the parsed data.

        //clean array

        var newArray = [];

        for(var i = 0; i< arrData.length; i++){
            if(!(arrData[i].length == 1 && arrData[i] == "")){

                if(arrData[i][arrData[i].length - 1] == "") arrData[i].pop();
                newArray.push(arrData[i]);

            }
        }

        return newArray;
    }
    function downloadCsv(name,csv){
        var exportedFilenmae = name;
        var blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
        if (navigator.msSaveBlob) { // IE 10+
            navigator.msSaveBlob(blob, exportedFilenmae);
        } else {
            var link = document.createElement("a");
            if (link.download !== undefined) { // feature detection
                // Browsers that support HTML5 download attribute
                var url = URL.createObjectURL(blob);
                link.setAttribute("href", url);
                link.setAttribute("download", exportedFilenmae);
                link.style.visibility = 'hidden';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            }
        }
    }
    function downloadJSON(name,csv){
        var exportedFilenmae = name;
        var blob = new Blob([csv], { type: 'text/json;charset=utf-8;' });
        if (navigator.msSaveBlob) { // IE 10+
            navigator.msSaveBlob(blob, exportedFilenmae);
        } else {
            var link = document.createElement("a");
            if (link.download !== undefined) { // feature detection
                // Browsers that support HTML5 download attribute
                var url = URL.createObjectURL(blob);
                link.setAttribute("href", url);
                link.setAttribute("download", exportedFilenmae);
                link.style.visibility = 'hidden';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            }
        }
    }

    function saveExcel(csv){
        var wb = XLSX.utils.book_new();
        wb.Props = {
            Title: "exportExcel",
            Subject: "exportExcel",
            Author: "Terna",
            CreatedDate: new Date()
        };


        var ws_name = "File_1";
        var array = CSVToArray(csv,";");
        var ws_data = array;
        var ws = XLSX.utils.aoa_to_sheet(ws_data);
        XLSX.utils.book_append_sheet(wb, ws, ws_name);


        /*for(var i = 0; i<this.arrayName.length;i++){
            wb.SheetNames.push(this.arrayName[i]);
            var array = e._CSVToArray(this.arrayCsv[i],";");

            var ws_data = [array];
            var ws = XLSX.utils.aoa_to_sheet(ws_data);
            wb.Sheets[this.arrayName[i]] = ws;
        }*/


        var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});
        function s2ab(s) {

            var buf = new ArrayBuffer(s.length);
            var view = new Uint8Array(buf);
            for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
            return buf;

        }

        var a = new Date();
        saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), "exportExcel"+"_"+a.getFullYear()+"-"+ (parseInt(a.getMonth()) + 1) +"-"+a.getDate()+'.xlsx');

    }
    jQuery('.btn-customReport').click(function(){
        jQuery(this).text(function(i,old){
            return old=='+' ?  '-' : '+';
        });
    });
    <?php if(!empty($arrayReportSommario)):?>
		jQuery("#exportTo").change(function(e){
			if(this.value == "json") downloadJSON("export.json",JSON.stringify(<?php echo $report_json;?>));
			if(this.value == "xls") saveExcel(window.csvSommario);
			if(this.value == "csv") downloadCsv("export.csv",window.csvSommario);
			jQuery("#exportTo").val(0);
		});
	
	
        jQuery('#csvSommarioDownload').click(function(){
            downloadCsv("export.csv",window.csvSommario);
        });

        jQuery('#jsonSommarioDownload').click(function(){
            downloadJSON("export.json",JSON.stringify(<?php echo $report_json;?>));
        });
        jQuery('#excelSommarioDownload').click(function(){
            saveExcel(window.csvSommario)
        });
    <?php endif;?>

    <?php if(!empty($arrayReportDettaglio)):?>
	
	jQuery("#exportTo2").change(function(e){
			if(this.value == "xls") saveExcel(window.csvDetails);
			if(this.value == "csv") downloadCsv("export.csv",window.csvDetails);
			jQuery("#exportTo2").val(0);
		});
        
		jQuery('#csvDetailsDownload').click(function(){
            downloadCsv("export.csv",window.csvDetails);
        });

        jQuery('#excelDetailsDownload').click(function(){
            saveExcel(window.csvDetails)
        });
    <?php endif;?>
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

<style>

#exportTo,#exportTo2{
	color: black;
    font-weight: bold;
    margin-right: 20px;
    float: right;
    padding: 0px 10px;
}
    .tableHoverCustom{position: relative}
    .content_text_custom{display: none;}
    .tableHoverCustom:hover > .content_text_custom{
        display: block;
        position: absolute;
        background: #f5f5f0;
        border: 1px solid #30373d;
        padding: 10px;
        z-index:1;
        top: 0;
        left: 0;}
</style>