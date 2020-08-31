<?php

header('Content-Type: application/json');

function parse_feed($feed){
    $contents = file_get_contents($feed);

    libxml_use_internal_errors(true);
    $feed_to_array = simplexml_load_string($contents);
    if (!$feed_to_array) {
        echo 'Unable to load ' . $feed;
        return;
    }

    $array = $feed_to_array->channel->item;

    $array = $feed_to_array->channel->item;
    $count = (count($array)<=8) ? count($array) : 8;

    $newArray = array();
    for ($i = 0; $i < $count; $i++){
        array_push($newArray,array(
            "link"=>$array[$i]->link[0],
            "title"=>$array[$i]->title[0]
        ));
    }

    echo json_encode($newArray);
}

$href = $_POST['href'];
if(empty($href)) exit("errore");

parse_feed($href);