<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_users
 *
 * @copyright   Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');
JHtml::_('behavior.formvalidator');
?>

<div class="bgrey">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="user-login bwhite">
					
					<div class="reset-confirm<?php echo $this->pageclass_sfx; ?>">
						<?php if ($this->params->get('show_page_heading')) : ?>
							<div class="page-header">
								<h1>
									<?php echo $this->escape($this->params->get('page_heading')); ?>
								</h1>
							</div>
						<?php endif; ?>

						<form action="<?php echo JRoute::_('index.php?option=com_users&task=reset.confirm'); ?>" method="post" class="form-validate">
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
		</div>
		<div class="row top30 bottom50"></div>
	</div>
</div>
