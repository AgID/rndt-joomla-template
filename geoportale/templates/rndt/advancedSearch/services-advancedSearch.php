<?php

header('Content-Type: application/json');

$GPT_REST_URL_SERVER = $_POST['GPT_REST_URL_SERVER'];
if(empty($GPT_REST_URL_SERVER)) exit("errore");

$url = urldecode($GPT_REST_URL_SERVER);

/*if (!(!filter_var($url, FILTER_VALIDATE_URL) === false)) {
    $str = str_replace('"',"%22",$url);
    $str = str_replace(' ',"%20",$str);
    $str = substr( $str, 1 );
    //$str = str_replace($_POST['url'],"",$url);
    //$str = str_replace("/","-specialkeyonlyserviceadvancedsearch-",$str);

    //$str = urlencode($str);
    //$str = str_replace("-specialkeyonlyserviceadvancedsearch-","/",$str);
    $url = $_POST['url'] ."?".$str;

}*/
//var_dump($url);

try {
    $opts = array(
        'http'=>array(
            'method'=>"GET",
            'header'=>"Accept-language: en\r\n" .
                "Cookie: foo=bar\r\n"
        )
    );

    $context = stream_context_create($opts);
	//$pos = strrpos($url, "?");
	//$inizio = substr($url, 0,$pos+1);
	//$fine = substr($url,$pos+1);
	
	//$url= $inizio . rawurlencode($fine);

//$encodedUrl = urlencode($url);

	$arrayQuery = explode("&", $url);
	for($i = 0; $i < count($arrayQuery); ++$i) {
		
		if (0 === strpos($arrayQuery[$i], 'searchText=')) {
			
			$arrayQuery[$i]= 'searchText=' . rawurlencode(substr($arrayQuery[$i],11));
			
		}
	}
	$url= implode("&", $arrayQuery);
	
//$fixedEncodedUrl = str_replace(['%2F', '%3A'], ['/', ':'], $url);

    $html = file_get_contents($url,false,$context);
	
} catch (Exception $e) {
    echo 'Caught exception: ',  $e->getMessage(), "\n";
}


if (empty($html) || strpos($html, 'HTTP Status 500') !== false) {
	$html = '{"totalResults" : 0,
		  "startIndex" : 1,
		  "itemsPerPage" : 15,
		  "records" : [
		  ],';
}else{
	$html =substr($html, 0, strlen($html)-1).",";
}

echo $html.'"urlSend":"'.$url.'"}';


function writeLog($stringa){
	$myfile = file_put_contents('logs.txt', $stringa.PHP_EOL , FILE_APPEND | LOCK_EX);
}

?>