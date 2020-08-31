<?php
$varUrl = $_GET['url'];


$opts = array(
    'http'=>array(
        'method'=>"GET",
        'header'=>"Accept-language: en\r\n" .
            "Cookie: foo=bar\r\n"
    )
);


$context = stream_context_create($opts);
$html = file_get_contents($varUrl,false,$context);




echo $html;


