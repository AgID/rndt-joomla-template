<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_users
 *
 * @copyright   Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');
JHtml::_('behavior.formvalidator');

$baseUrl = JURI::root();
$baseUrl = strpos($baseUrl, 'https') !== false ? str_replace("https",GENERIC_FORCE_PROTOCOL,$baseUrl): str_replace("http",GENERIC_FORCE_PROTOCOL,$baseUrl);


define('BASE_URL_PROTO', $baseUrl);

$app = JFactory::getApplication();
$baseUrl  = BASE_URL_PROTO;
$baseurls = $baseUrl.'/templates/'.$app->getTemplate().'/';

?>
<div class="bgrey">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="user-login bwhite">
					
					<h1><?php echo JText::_('COM_USERS_RESET'); ?></h1>
					<p><?php echo JText::_('COM_USERS_RESET_LABEL'); ?></p>
					
					<form id="user-registration" action="<?php echo JRoute::_('index.php?option=com_users&task=reset.request'); ?>" method="post" class="form-validate">
						<?php foreach ($this->form->getFieldsets() as $fieldset) : ?>
							<fieldset>
								<p><?php echo JText::_($fieldset->label); ?></p>
								<?php foreach ($this->form->getFieldset($fieldset->name) as $name => $field) : ?>
									<div class="top20">
										<div class="bottom5 left12 bold">
											<?php echo $field->label; ?>
										</div>
										<div class="input-group full-width">
											<?php echo $field->input; ?>
										</div>
									</div>
								<?php endforeach; ?>
							</fieldset>
						<?php endforeach; ?>

						<div class="row top50">
							<div class="col-md-6 col-md-offset-3">
								<button type="submit" class="btn bgreen"><?php echo JText::_('JSUBMIT'); ?></button>
							</div>
						</div>
								
						<?php echo JHtml::_('form.token'); ?>
					</form>
				</div>
			</div>
		</div>
		
		<div class="row top30 bottom50">
			<div class="col-md-6 col-md-offset-3">
				<div class="row">
					<div class="col-md-12 text-center vcenter45">
						<img class="bottom2" src="<?php echo JUri::base();?>/templates/rndt/images/icons/Back.png" alt="<?= JText::_('BACK') ?>">
						<a class="" href="/login" title="<?= JText::_('BACK') ?>"><?= JText::_('BACK') ?></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>