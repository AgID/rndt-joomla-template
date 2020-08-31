<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>


<ol class="nav nav-tabs nav-stacked">
<?php
	foreach ($this->link_items as &$item) :
?>
	<li>
		<a href="<?php echo JRoute::_(ContentHelperRoute::getArticleRoute($item->slug, $item->catid, $item->language)); ?>">
			<?php echo $item->title.' <br /><span>'.JText::sprintf('COM_CONTENT_CREATED_DATE_ON',JHtml::_('date', $item->created, JText::_('DATE_FORMAT_LC3'))).'</span>'; ?>
     
	
      </a>
	</li>
<?php endforeach; ?>
</ol>
