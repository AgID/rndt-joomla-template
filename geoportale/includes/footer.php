<?php

defined('JPATH_BASE') or die;

$id = getArticleId('home');
$article = JTable::getInstance('content');
$article->load($id);

?>

	</div><!-- /#main, /#main-wrapper -->
</div><!-- /main-inner -->

<div class="section section_grey_darker clearfix">
	<footer class="footer_container container-fluid top100 bottom20" id="footer">
		<div class="container-fluid">
			<div class="row title_row">
				<div class="col-md-4 col-sm-5 col-xs-12">
					<div class="logo_container clearfix left25">
						<div class="logo_wrapper clearfix">
							<a href="http://www.agid.gov.it" target="_blank">
								<img src="<?php echo $baseurls; ?>images/agid_logo.png" id="logo_agid" class="logo" alt="Logo AgID">
							</a>
						</div>
					</div>
					<!-- /logo_container -->
				</div>
			</div>
		</div>
				
		<div class="container-fluid top20">
			
			<div class="row">
				<?php
					echo '<div class="col-md-4">
							<div class="box_text box_text_footer footer_text clearfix">
								<h4>'.JText::_('SITE_NAME').'</h4>
								'.get_field($article, 'informazioni-footer-'.$lang_code).'
							</div>
						</div>';
				?>
				
				<div class="col-md-4 col-md-offset-4">
					<div class="box_text box_text_footer footer_text clearfix">
						<h4><?= JText::_('CONTACTS') ?></h4>
						<?= get_field($article, 'contatti-footer-'.$lang_code) ?>
					</div>
					<div class="footer_social footer_text clearfix top20">
						
						<?php
						if($link_social)
						{
							echo '<span>'.JText::_('FOLLOW_US').'</span>';
							
							foreach($link_social as $nome => $link)
							{
								$icona = (strpos(strtolower($nome), 'rss')!== false) ?  'rss' : strtolower($nome);
								
								echo '<a href="'.$link.'" title="'.$nome.'" class="link_social" target="_blank">
											<span class="text-center"><i class="fa fa-'.$icona.'"></i></span>
										</a>';
							}
						}
						?>
					</div>
					<!-- /footer_social -->
				</div>
			</div>
		</div>
		
		<div class="row top20">
			<div class="col-md-11 text-center">
				<ul class="footer_links clearfix">
					<?php
						if($link_footer = get_field_list('link-footer-'.$lang_code))
							foreach($link_footer as $link_name => $link_url)
								echo '<li><a class="right25" href="'.$link_url.'" title="">'.$link_name.'</a></li>';
					?>
				</ul>
				<!--a href="http://www.governo.it/feed/rss" title="Feed RSS" class="rss_feed"><span class="icon-rss-two"></span></a-->
			</div>
			<!-- /col-md-12 -->
		</div>
		<!-- /row -->
	</footer>
	<!-- /footer_container -->
</div>
<!-- /section -->
</div><!-- /push_container -->

<!-- guida -->
<?= getContent('guida') ?>