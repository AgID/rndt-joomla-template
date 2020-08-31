<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

require_once JPATH_BASE . '/includes/functions.php';

$input = JFactory::getApplication()->input;
$id = $input->getInt('id'); //get the article ID
$article = JTable::getInstance('content');
$article->load($id);
$title	= $article->get('title');

$lang = JFactory::getLanguage();
$lang_code = substr($lang->getTag(), 0,2);

$guida = ($guida=trim(get_field($article, 'guida-popup-'.$lang_code))) ? $guida : JText::_('EMPTY_GUIDE');

?>

<!-- Modal -->
<div class="modal fade" id="guida" tabindex="-1" role="dialog" aria-labelledby="guidaOnLine">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="guidaOnLine"><?= $title ?></h4>
			</div>
			<div class="modal-body">
				<?= $guida ?>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn bgreen btnsmall" data-dismiss="modal"><?= JText::_('CLOSE') ?></button>
			</div>
		</div>
	</div>
</div>