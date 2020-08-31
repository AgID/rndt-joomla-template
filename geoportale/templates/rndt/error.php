<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.protostar
 *
 * @copyright   Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;


if(($this->error->getCode()) == '404')
	header('Location: ./404');
else
	echo $this->error->getCode().' - '.$this->error->getMessage();

exit;