<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

require_once JPATH_BASE . '/includes/functions.php';

//$urlComplete = htmlentities($_POST['url_scheda_metadati']);

$urlC = GPT_BASE_URL."/catalog/search/resource/details.page?uuid=";
$urlComplete = !empty(htmlentities($_POST['url_scheda_metadati'])) ? htmlentities($_POST['url_scheda_metadati']) : $urlC.htmlentities($_GET['uuid']);


if(!$urlComplete)
	echo "<div class='alert alert-danger left25 right25 top100 bottom100'>Parametri mancanti</div>";
else
{
	?>

	<div class="container-fluid top30 bottom50">
		<div class="row">
			<div class="col-md-12">
				<h2 class=""><?= JHtml::_('content.prepare', '{loadmodule breadcrumbs}') ?></h2>
				<iframe class="iframe_geoportal" scrolling="no" src="<?php echo $urlComplete;?>" title="<?= $this->escape($this->item->title) ?>"></iframe>
			</div>
		</div>
	</div>

	<script language="javascript" type="text/javascript">

		function getCookie(cname) {
			var name = cname + "=";
			var decodedCookie = decodeURIComponent(document.cookie);
			var ca = decodedCookie.split(';');
			for(var i = 0; i <ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') {
					c = c.substring(1);
				}
				if (c.indexOf(name) == 0) {
					return c.substring(name.length, c.length);
				}
			}
			return "";
		}
		
		function delete_cookie( name ) {
			document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
		}
		
	jQuery(document).ready(function(){
		var height = getCookie("iframeHeightGeoportal");
		delete_cookie("iframeHeightGeoportal");
		
		setInterval(function(){
		
			var height2 = getCookie("iframeHeightGeoportal");
			jQuery(".iframe_geoportal").height(height2);
		
		}, 500);
		
		jQuery(".iframe_geoportal").height(height);
	});
	</script>

<?php } ?>