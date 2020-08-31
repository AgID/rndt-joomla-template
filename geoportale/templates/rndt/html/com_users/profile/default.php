<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_users
 *
 * @copyright   Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$this->form->reset( true ); // to reset the form xml loaded by the view
if (!defined("DS")): define("DS", DIRECTORY_SEPARATOR);
$this->form->loadFile( dirname(__FILE__) . DS . "profile.xml"); // to load in our own version of login.xml
  
?>
<div class="bgrey">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="user-login bottom100 bwhite">
					<div class="profile<?php echo $this->pageclass_sfx?>">
						<?php if ($this->params->get('show_page_heading')) : ?>
						<div class="page-header">
							<h1>
								<?php echo $this->escape($this->params->get('page_heading')); ?>
							</h1>
						</div>
						<?php endif; ?>
						<?php if (JFactory::getUser()->id == $this->data->id) : ?>
						<ul class="btn-toolbar pull-right">
							<li class="btn-group">
								<a class="btn" href="<?php echo JRoute::_('index.php?option=com_users&task=profile.edit&user_id=' . (int) $this->data->id);?>">
									<span class="icon-user"></span> <?php echo JText::_('COM_USERS_EDIT_PROFILE'); ?></a>
							</li>
						</ul>
						<?php endif; ?>
						<?php echo $this->loadTemplate('core'); ?>

						<?php echo $this->loadTemplate('params'); ?>

						<?php echo $this->loadTemplate('custom'); ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
