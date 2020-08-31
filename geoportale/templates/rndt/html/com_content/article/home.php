<?php 
// No direct access
defined('_JEXEC') or die;

/*
 * Cookie 'refer_url'
 * utile per tener traccia della pagina da cui si proviene, in questo modo è possibile gestire, in modo più idoneo,
 * i cookie nella pagina metadati.php
 *
 * @author paolo martufi 2017-06-27
 */
setcookie('refer_url', "home", time() + (3600), "/"); // 3600 = 1 giorno
require_once JPATH_BASE . '/includes/functions.php';

?>

<div class="container-fluid home-map" style="background:transparent url('<?= $baseurls ?>images/photo/home.png') no-repeat; background-size:cover;background-position:center;height:400px;">
	<div class="row">
		<div class="col-md-12 text-center">
			<h1 class="home-title grey"><?= JText::_('HOME_TITLE') ?></h1>
			
			<div class="col-md-6 col-md-offset-3 top10">
				<div id="home-search" class="input-group">
					<label for="searchText" class="sr-only"><?= JText::_('METADATA_SEARCH') ?></label>
					<input id="searchText" type="text" class="form-control" placeholder="<?= JText::_('METADATA_SEARCH') ?>">
					<span class="input-group-addon home-search" id="simple-search">
						<img class="home-search-icon" src="<?php echo $baseurls; ?>images/icons/SeachMenuBar.png" alt="<?= JText::_('METADATA_SEARCH') ?>" title="<?= JText::_('METADATA_SEARCH') ?>" tabindex="0">
					</span>
				</div>
				
				<div class="top20 white">
					<a class="white pull-left" href="<?= JText::_('URL_ADVANCED_SEARCH') ?>">
						<?= JText::_('GO_TO_ADVANCED_SEARCH') ?>
						<img class="bottom2" src="<?= $baseurls ?>images/icons/NextWhite.png" alt="" />
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container top80">
	<div class="row">
		<div class="col-md-6 col-md-offset-0 col-xs-offset-2 bottom50">
			<?php echo getContent('home.chart') ?>
		</div>
		
		<div class="col-md-6">
			<?php echo getContent('home.top_news') ?>
		</div>
	</div>
</div>

<div class="container-fluid pbottom20 top20">
	<?php echo getContent('home.inspire_cluster') ?>
</div>

<div class="bgrey">
	<div class="container">
		<?php echo getContent('home.news') ?>
	</div>
</div>