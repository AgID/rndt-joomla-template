<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_custom
 *
 * @copyright   Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>


<div class="custom<?php echo $moduleclass_sfx ?>">
<p class="sin">
<?php if ($params->get('backgroundimage')) : ?> 
<img src="<?php echo JURI::base( true ).'/'.$params->get('backgroundimage');?>" alt="immagine" />

<?php endif;?>

</p>
<div class="des">
	<h3><?php echo $module->title;?></h3>
	<?php echo $module->content;?>
</div>
</div>
