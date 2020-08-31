<?php

defined('JPATH_BASE') or die;

$app    = JFactory::getApplication();
$baseurls   = JURI::base(true).'/templates/'.$app->getTemplate().'/';

$juser = JFactory::getUser();
$jusername = $juser->username;

require_once JPATH_BASE . '/includes/functions.php';

$url = GPT_BASE_URL_SERVER.'/rest/usage/harvester/list?tipo_stat=TIPOLOGIA&start-date=2000-01-01';

function getByURL($url, $debug = false){
	if($debug) return "<br>DEBUG -> ".$url;
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

$json = getByURL($url);
$dati = $json['harvester']['elencoStat'][0]['dettaglio'][0]['conteggio'];

$labels = '';
$data = '';
$comma = '';

$dataSet = 0;
$serie = 0;
$servizio = 0;



$labels = '"'.JText::_('ADVSEARCH_DATASET').'", "'.JText::_('ADVSEARCH_SERIES').'", "'.JText::_('ADVSEARCH_SERVICES2').'"';

foreach($dati as $key => $value)
{
	$value['raggruppamento'] = strtolower ($value['raggruppamento']);
	if($value['raggruppamento']){
		//$labels .= $comma . '\'' . $value['raggruppamento'] .'\'';
		if($value['raggruppamento'] == "dataset" || $value['raggruppamento'] == "005") 
			$dataSet += intval($value['conteggio']); 
		if($value['raggruppamento'] == "serie" || $value['raggruppamento'] == "series"|| $value['raggruppamento'] == "006") 
			$serie += intval($value['conteggio']); 
		if($value['raggruppamento'] == "servizio" || $value['raggruppamento'] == "service" || $value['raggruppamento'] == "services" || $value['raggruppamento'] == "014") 
			$servizio += intval($value['conteggio']); 

	}
}

$data = $dataSet.",".$serie.",".$servizio;

$color = array();
foreach($dati as $item)
   array_push($color,sprintf('#%06X', mt_rand(0, 0xFFFFFF)));

?>

<div style="width:300px;">
	<canvas id="myChart" width="300" height="300"></canvas>
	
	<?php if(true or $jusername){ ?>
		<div class="top20">
			<a class="green" href="<?= JRoute::_(JText::_('URL_STATS')) ?>">
				<?= JText::_('HOME_STATS_BUTTON') ?>
				<img style="margin-bottom:2px" src="<?= $baseurls ?>images/icons/Next.png" alt="" />
			</a>
		</div>
	<?php } ?>

	<script src="<?= $baseurls ?>js/chart.min.js"></script>

	<script>
        var data = {
			labels: [<?= $labels ?>], 
			datasets: [
				{
					data: [<?= $data ?>], 
					borderWidth: 1, 
					borderColor: ["<?php echo implode('","',$color);?>"], 
					backgroundColor: ["<?php echo implode('","',$color);?>"], 
					hoverBackgroundColor: ["<?php echo implode('","',$color);?>"]
				}
			]
		};
		
		var myPieChart = new Chart('myChart',{
			type: 'doughnut',
			data: data,
			options: {
				title: {
					display: true,
					position: 'top',
					fullWidth: true,
					fontSize: 18,
					padding: 20,
					fontFamily: "'Source Sans Pro',sans-serif",
					fontStyle: 'bold',
					fontColor: '#1c2024',
					text: '<?= JText::_('HOME_STATS_CHART') ?>'
                },
				legend: {
					position: 'right',
					onClick: function (e) {
						e.stopPropagation();
					}
				}
			}
		});
	</script>
</div>
