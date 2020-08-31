<?php

/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

//controllo lingua da dove mi arriva


$title = $_COOKIE['geoportalLocale'] == "en" ? "404. Page not found": $this->escape($this->item->title);
$content = $_COOKIE['geoportalLocale'] == "en" ? "You will be redirected to Home": JText::_('JERROR_LAYOUT_PAGE_NOT_FOUND');

$headerData['title'] = $title;

echo JLayoutHelper::render('joomla.content.articleHeader', $headerData);

?>

<div class="container top100 bottom100">
	<h6>
	<?= $content; ?>
	</h6>
</div>

<script>
	setTimeout(function(){ location.href = "/<?php echo $_COOKIE['geoportalLocale'] == "en" ? "eng": "";?>"; }, 3000);
</script>