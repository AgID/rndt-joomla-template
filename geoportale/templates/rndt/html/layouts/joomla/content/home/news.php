<?php

defined('JPATH_BASE') or die;


if($notizie = get_field_list('notizie'))
{
	foreach($notizie as $alias)
		if($alias)
			$articleIDs[] = getArticleId($alias);
}

?>

<div class="row top80">
	<div class="col-md-12">
		<h1 class="bold"><?= JText::_('NEWS_TITLE') ?></h1>
		<div class="title-underline top20"><div></div></div>
	</div>
</div>

<div class="row top40">
	<?php for($x=0; $x<3; $x++)
	{
		$article_id = $articleIDs[$x];
		$article = get_article($article_id);
		
		$publish_date = date('d/m/Y', strtotime($article->get('publish_up')));
		$images  = json_decode($article->get('images'));
		
		$introtext = $article->get('introtext');
		
		$introtext = strip_tags($introtext);
		if(strlen($introtext)>175){
			$introtext = substr($introtext, 0, 175).'...';
		}
		$url = JRoute::_(ContentHelperRoute::getArticleRoute($article_id, $article->catid, $article->language));
		?>
		
		<div class="col-md-4">
			<div class="news">
				<div class="news-img-div">
					<a href="<?= $url ?>" title="<?= htmlspecialchars($article->get('title')) ?>" tabindex="-1">
						<div alt="<?= htmlspecialchars($article->get('title')) ?>" class="news-img" style="background-image:url('<?= $images->image_intro ?>');" ></div>
					</a>
				</div>
				<div class="news-text">
					<h4><?= $publish_date ?></h4>
					<a href="<?= $url ?>">
						<h3><?= $article->get('title') ?></h3>
					</a>
					<span>
						<?= $introtext ?>
					</span>
				</div>
			</div>
		</div>
	<?php } ?>
</div>

<div class="row text-center top50 bottom100">
	<div class="col-md-4 col-md-offset-4 text-center">
		<a class="btn bgreen bold news_btn" href="<?= JText::_('NEWS_ARTICLE') ?>"><?= JText::_('NEWS_BUTTON') ?></a>
	<div>
</div>