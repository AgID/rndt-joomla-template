<div class="article_header <?= !empty($displayData['class']) ? $displayData['class'] : 'default_header' ?>">
	
	<div class="over-article">
		<div class="container">
		<div class="row">
			<div class="col-md-12 white">
				<?= JHtml::_('content.prepare', '{loadmodule breadcrumbs}') ?>
			</div>
		</div>
		<div class="row hidden-xs">
			<div class="col-md-12 white">
				<h1>
					<?= $displayData['title'] ?>
				</h1>
			</div>
		</div>
	</div>
	</div>
</div>

<style>
	ul.breadcrumb>li>a>span,
	ul.breadcrumb>li>span,
	ul.breadcrumb>li{
		font-size:medium;
		font-weight:normal;
		color:#fff!important;
	}
	
</style>
