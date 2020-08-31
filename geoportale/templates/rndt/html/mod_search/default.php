<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_search
 *
 * @copyright   Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Including fallback code for the placeholder attribute in the search field.
JHtml::_('jquery.framework');
JHtml::_('script', 'system/html5fallback.js', false, true);

$app    = JFactory::getApplication();
$baseurls   = JURI::base(true).'/templates/'.$app->getTemplate().'/';

if ($width)
{
	$moduleclass_sfx .= ' ' . 'mod_search' . $module->id;
	$css = 'div.mod_search' . $module->id . ' input[type="search"]{ width:auto; }';
	JFactory::getDocument()->addStyleDeclaration($css);
	$width = ' size="' . $width . '"';
}
else
{
	$width = '';
}
?>
<div class="search<?php echo $moduleclass_sfx ?>">
	<form action="<?php echo JRoute::_('index.php');?>" method="post" class="form-inline">
		<div class="input-group" id="search-form">
			<?php
				$output = '<label for="mod-search-searchword" class="sr-only">' . $label . '</label> ';
				$output .= '<input name="searchword" id="mod-search-searchword" maxlength="' . $maxlength . '"  class="inputbox search-query" type="search"' . $width;
				$output .= ' placeholder="' . $text . '" />';

				if ($button) :
					if ($imagebutton) :
						$btn_output = ' <input type="image" alt="' . $button_text . '" class="button" src="' . $img . '" onclick="this.form.searchword.focus();"/>';
					else :
						$btn_output = ' <span class="input-group-btn">
											<label for="cerca" class="sr-only">' . $button_text . '</label>
											<button id="cerca" class=" btn bwhite noborder header_search_button" onclick="this.form.searchword.focus();">
												<img class="home-search-icon" src="'.$baseurls.'images/icons/SeachMenuBar.png" alt="'.$button_text.'" title="'.$button_text.'">
											</button>
										</span>';
					endif;

					switch ($button_pos) :
						case 'top' :
							$output = $btn_output . '<br />' . $output;
							break;

						case 'bottom' :
							$output .= '<br />' . $btn_output;
							break;

						case 'right' :
							$output .= $btn_output;
							break;

						case 'left' :
						default :
							$output = $btn_output . $output;
							break;
					endswitch;
				endif;

				echo $output;
			?>
			<input type="hidden" name="task" value="search" />
			<input type="hidden" name="option" value="com_search" />
			<input type="hidden" name="Itemid" value="<?php echo $mitemid; ?>" />
		</div>
	</form>
</div>
<jdoc:include type="modules" name="modulo1" style="xhtml" />