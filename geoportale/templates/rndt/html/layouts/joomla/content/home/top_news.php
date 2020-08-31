<?php

defined('JPATH_BASE') or die;

$app    = JFactory::getApplication();
$baseurls   = JURI::base(true).'/templates/'.$app->getTemplate().'/';

$lang = JFactory::getLanguage();
$lang_code = substr($lang->getTag(), 0,2);

function get_top_news()
{
	if($news = get_field_list('news'))
	{
		foreach($news as $alias)
			if($alias)
				$articles[] = get_article(getArticleId($alias));
	}
	else
	{
		//get latest articles
		$query = "SELECT * FROM #__content ORDER BY publish_up DESC LIMIT 2";
		$db = JFactory::getDBO();
		$db->setQuery($query);
		$articles = $db->loadObjectList();
	}

	foreach($articles as $key=>$article){
		$publish_date = date('d/m/Y', strtotime($article->publish_up));

		$introtext = $article->introtext;

		$introtext = strip_tags($introtext);
		if(strlen($introtext)>175){
			$introtext = substr($introtext, 0, 175).'...';
		}

		$url = JRoute::_(ContentHelperRoute::getArticleRoute($article->id, $article->catid, $article->language));

		?>
			<div class="bottom5"><?= $publish_date ?></div>
			<div class="bold bottom5">
				<a href="<?= $url ?>"><?= $article->title ?></a>
			</div>
			<div class="bottom20"><?= $introtext ?></div>
		<?php
		if($key==0){
			?><hr><?php
		}
	}
}
/*
function parse_feed($feed)
{
	$contents = file_get_contents($feed);

	libxml_use_internal_errors(true);
	$feed_to_array = simplexml_load_string($contents);
	if(!$feed_to_array){
		echo 'Unable to load '.$feed;
		return;
	}

	$array = $feed_to_array->channel->item;
	$count = (count($array)<=8) ? count($array) : 8;
	for ($i = 0; $i < $count; $i++){
		?>
			<div class="item-news">
				<a href="<?php echo $array[$i]->link; ?>" target="_blank">
					<h6><?php echo $array[$i]->title; ?></h6>
				</a>
			</div>
		<?php
	}
}*/

$feed = get_field_list('feed-'.$lang_code);

$num_tabs = count($feed)+1;

end($feed);
$link_feed_rss = $feed[key($feed)];

?>

<div id="news">

	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/redmond/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<style>
		#tab ul{
			background: none;
			border: none;
			padding-bottom: 10px;
			border-bottom: 5px solid #CCCCCC;
		}
		.ui-widget-header {
			border: none!important;
			border-bottom: 2px solid #CCCCCC!important;
			background: none;
			border-radius: 0px;
		}

		.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active {
			font-weight: bold;
			color: #fff!important;
			border: none;
			border-radius: 5px;
		}
		.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
			background: #fff;
			border: none;
			padding: 0!important;
		}
		.ui-tabs, .ui-tabs-nav{
			padding: 0!important;
		}
		.ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited {
			border-radius: 0px;
			border-bottom: 5px solid #007e6d;
		}
		.ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited{
			color: #5A6772;
		}
		.ui-state-active a.ui-tabs-anchor, .ui-state-active a:link, .ui-state-active a:visited{
			color: #1c2024;
		}
		#tabs{
			border: none;
		}
		#news{
			font-family:'Source Sans Pro',sans-serif;
			font-size: smaller;
		}
	</style>

	<div id="tabs">
		<ul>
			<li><a href='#tabs-1'><?= JText::_('NEWS_FEED') ?></a></li>
			<?php
				$i=1;
				foreach($feed as $name => $link)
					if($i++<=$num_tabs)
						echo "<li><a class=\"content-link\" href='#tabs-$i'>$name</a></li>";
			?>
		</ul>

		<div class="content-news" id="tabs-1">
			<?php get_top_news() ?>
		</div>

		<?php

		$i=2;
		foreach($feed as $name => $link){
			if($i<=$num_tabs){
				if(substr($link,0,4)!='http') $link = JURI::base(true) . $link;

				?>
					<div class="content-news" id="tabs-<?= $i++ ?>" data-link="<?php echo $link;?>">
                        <?= JText::_('LOADING_NEWS') ?>...
                    </div>
				<?php
			}
		}
		?>
	</div>



</div>

<script>

    jQuery(".content-link").click(function(){
        var id = this.getAttribute("href");
        var link = jQuery(id)[0].getAttribute("data-link");

        jQuery(id).html('');
        jQuery.post("<?= JURI::base(); ?>/templates/rndt/advancedSearch/proxyFeed.php",{href:link})
            .done(function( data ) {
                if(data.length != 0){
                    for(var i = 0; i<data.length;i++){
                        jQuery(id).append('<div class="item-news"><a href="'+data[i]["link"][0]+'" target="_blank"><h6>'+data[i]["title"][0]+'</h6></a></div>')
                    }
                }else{
                    jQuery(id).append('<div class="item-news"><?= JText::_('LOAD_FAILED') ?></div>');
                }
            }).fail(function() {
                jQuery(id).append('<div class="item-news"><?= JText::_('LOAD_FAILED') ?></div>');
        });
    });
    /*jQuery.post("/templates/rndt/advancedSearch/proxyFeed.php",{href:"http://inspire.ec.europa.eu/news_rss"}, function(data, status){
        debugger;
    });*/

	jQuery(document).ready(function() {
		var controlBaseUrl = '<?= JURI::base(); ?>';
		//casi speciali
		var case1 = baseurl+"?" == location.href;
		var case2 = baseurl+"/" == location.href;
		var case3 = location.href.indexOf(baseurl+"?") != -1;

		if(case1 || case2 || case3){
			location.href = baseurl;
		}else{
			jQuery("#tabs").tabs();
		}
		<?php
			for($i=2; $i<=$num_tabs; $i++)
				echo "jQuery('#tabs-$i').hide();";
		?>

		jQuery('li.ui-state-default').delay(350).removeAttr('tabindex');
		jQuery('a.ui-tabs-anchor').delay(350).removeAttr('tabindex');

	});
</script>
