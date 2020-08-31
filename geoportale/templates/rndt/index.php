<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.protostar
 *
 * @copyright   Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

require_once JPATH_BASE . '/includes/functions.php';
	
/* JFactory::getDocument()->setGenerator('Claudio Carrera'); */

$app = JFactory::getApplication();
$doc = JFactory::getDocument();
$templateparams = $app -> getTemplate(true) -> params;
$config = JFactory::getConfig();


$baseUrl = JUri::base();
$baseUrl = strpos($baseUrl, 'https') !== false ? str_replace("https",GENERIC_FORCE_PROTOCOL,$baseUrl): str_replace("http",GENERIC_FORCE_PROTOCOL,$baseUrl);
$baseurls = $baseUrl .'templates/' . $this -> template . '/';

$user = JFactory::getUser();
//elimino mootools e caption, se uno serve eliminare solo l'altro.
$search = array('mootools');
// remove the js files
foreach ($this->_scripts as $key => $script) {
	foreach ($search as $findme) {
		if (stristr($key, $findme) !== false) {
			unset($this -> _scripts[$key]);
		}
	}
}

//languages
$lang = JFactory::getLanguage();
$lang_code = substr($lang->getTag(), 0,2);
$languages = array_reverse(array_keys(JLanguage::getKnownLanguages()));

$jinput		= $app		-> input;
$option		= $jinput	-> get('option', '', 'cmd');
$getMenu	= $app		-> getMenu();
$getActive	= $getMenu	-> getActive();
$id			= $getActive ? $getActive->id : 0;

JHtml::_('bootstrap.framework',false);

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" class="js">
	
	<?php require_once JPATH_BASE . '/includes/header.php'; ?>
			
		<div id="main">
			<div id="content">
				<div class="content">
					<div class="node node-pagina-generica-alberatura node-promoted view-mode-full clearfix">
						<jdoc:include type="message" />
						<jdoc:include type="component" />
					</div>
				</div>
			</div>
		</div>
		
	
	<?php require_once JPATH_BASE . '/includes/footer.php'; ?>
	
	<script>
		var baseurl		 = '<?= $baseUrl ?>';
		var gpt_rest_url = '<?= GPT_REST_URL ?>';
		var metadati_url = '<?= $baseUrl ?><?= JText::_('URL_METADATA') ?>';
		var guide_url	 = '<?= getGuideurl() ?>';
		var lang_code	 = '<?= $lang_code ?>';
		var guida_title	 = '<?= JText::_('GUIDA_TEXT') ?>';
		var privacy_message	 = '<?= JText::_('PRIVACY_MESSAGE') ?>';
		var privacy_accept	 = '<?= JText::_('PRIVACY_ACCEPT') ?>';
		var privacy_policy	 = '<?= JText::_('PRIVACY_POLICY') ?>';
		var privacy_url		 = '<?= JText::_('URL_PRIVACY') ?>';
		var privacy_domain	 = '<?= $config->get('privacy_domain') ?>';
		var search_label	 = '<?= JText::_('SEARCH') ?>';
		
		// Se non c'è il carrello allora NON sono sulla pagina di visualizazione risutlati che è l'unico posto dove servono i cookie
		if(!jQuery(".vedi-carrello").length){
			document.cookie = 'datiRicercaUrl=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
			document.cookie = 'datiRicerca=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
			document.cookie = 'saveCompositeStr=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
			document.cookie = 'saveObjSearchText=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
		}
	</script>
	<script type="text/javascript" src="<?php echo $baseurls; ?>js/scriptc.js"></script>
	<jdoc:include type="modules" name="position-3" style="xhtml" />
	<jdoc:include type="modules" name="position-2" style="none" />
	<jdoc:include type="modules" name="debug" style="none" />
	
	</body>
</html>
