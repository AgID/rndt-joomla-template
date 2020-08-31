<?php
defined('JPATH_BASE') or die;
$juser = JFactory::getUser();
$jusername = $juser->username;
?>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<jdoc:include type="head" />

	<!--link type="text/css" rel="stylesheet" href="<?php echo $baseurls; ?>css/jquery-ui.min.css" media="all"-->
	<link type="text/css" rel="stylesheet" href="<?php echo $baseurls; ?>css/font-awesome.min.css" media="all">
	<link type="text/css" rel="stylesheet" href="<?php echo $baseurls; ?>css/jquery.cookiebar.css" media="all">
	<link type="text/css" rel="stylesheet" href="<?php echo $baseurls; ?>css/jquery.dataTables.min.css" media="all">

	<link type="text/css" rel="stylesheet" href="<?php echo $baseurls; ?>css/bootstrap.min.css" media="all">

	<link type="text/css" rel="stylesheet" href="<?php echo $baseurls; ?>css/template.css" media="all">

	<!--[if lte IE 8]>
	<link type="text/css" rel="stylesheet" href="<?php echo $baseurls; ?>css/ie8.css" media="all" />
	<![endif]-->

	<!--[if lte IE 7]>
	<link type="text/css" rel="stylesheet" href="<?php echo $baseurls; ?>css/ie7.css" media="all" />
	<![endif]-->

	<!-- Owl Carousel Stylesheets -->
	<link rel="stylesheet" href="<?php echo $baseurls; ?>css/owl.carousel.min.css">
	<link rel="stylesheet" href="<?php echo $baseurls; ?>css/owl.theme.default.min.css">

	<!-- Bootstrap collapse -->
	<script src="<?php echo $baseurls; ?>js/collapse.js"></script>

	<!--script type="text/javascript" src="<?php echo $baseurls; ?>js/jquery-ui.min.js"></script-->
	<script type="text/javascript" src="<?php echo $baseurls; ?>js/script.js"></script>
	<script type="text/javascript" src="<?php echo $baseurls; ?>js/jquery.cookiebar.js"></script>
	<script type="text/javascript" src="<?php echo $baseurls; ?>js/jquery.dataTables.min.js"></script>

	<!-- Owl Carousel Javascript -->
	<script src="<?php echo $baseurls; ?>js/owl.carousel.min.js"></script>

	<!-- Include Date Range Picker -->
	<link rel="stylesheet" href="<?php echo $baseurls; ?>css/daterangepicker.css" />
	<script src="<?php echo $baseurls; ?>js/moment.min.js"></script>
	<script src="<?php echo $baseurls; ?>js/daterangepicker.js"></script>

	<link rel="sitemap" type="application/xml" title="Sitemap Geoportal" href="https://geodati.gov.it/geoportalRNDTPA/sitemap" /> 
</head>

<body>

<?php

//serve per capire se si è connessi a un portale o ad un'altro
$juser = JFactory::getUser();
$jusername = $juser->username;
$groups = $juser->groups;

// 7=Administrator;	8=Super User
$is_admin = (in_array(7, $groups) or in_array(8, $groups)) ? "true" : "false";

//debug
//echo '<div id="login_role_account_user" style="display: none;">'. var_dump($juser) .'</div>';


?>

<?php if($is_admin) : ?><div id="login_role_custom_account" style="display: none;"><?php echo $is_admin;?></div><?php endif;?>

<a class="skip-main" href="#main">Skip to main content</a>

<!-- Fascia Governo & Servizi -->
<section class="preheader">
	<div class="container-fluid">
		<div class="row clearfix">
			<div class="col-md-8 col-sm-7 hidden-xs">
				<a href="http://www.agid.gov.it/" target="_blank" title="Agenzia per l'Italia Digitale">
					<span class="hidden-sm" id="ConsMinistri">Agenzia per l'Italia Digitale</span>
				</a>
			</div>
			<div class="col-md-2 col-sm-2 hidden-xs nopadding">
				<div class="accessibility-buttons">
					<img src="<?= $baseurls ?>images/accessibility/zoom-out.png"	class="accessibility zoom_out"	title="<?= JText::_('ACCESSIBILITY_ZOOM_OUT')		?>"	alt="<?= JText::_('ACCESSIBILITY_ZOOM_OUT')			?>" tabindex="0">
					<img src="<?= $baseurls ?>images/accessibility/zoom-in.png"		class="accessibility zoom_in"	title="<?= JText::_('ACCESSIBILITY_ZOOM_IN')		?>"	alt="<?= JText::_('ACCESSIBILITY_ZOOM_IN')			?>" tabindex="0">
					<img src="<?= $baseurls ?>images/accessibility/contrast.png"	class="accessibility contrast"	title="<?= JText::_('ACCESSIBILITY_HIGH_CONTRAST')	?>"	alt="<?= JText::_('ACCESSIBILITY_HIGH_CONTRAST')	?>" tabindex="0">
					<img src="<?= $baseurls ?>images/accessibility/undo.png"		class="accessibility undo"		title="<?= JText::_('ACCESSIBILITY_RESET')			?>"	alt="<?= JText::_('ACCESSIBILITY_RESET')			?>" tabindex="0">
				</div>
			</div>
			<div class="col-md-2 col-sm-3 col-xs-12 nopadding">

				<?php if($jusername){
					$userToken = JSession::getFormToken();
					?>
					<a class="accedi dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">
						<span><?= $juser->name ?></span>
						<img src="<?= $baseurls ?>images/icons/ArrowDownWhite.png" class="bottom3" alt="Apri menu utente" />
					</a>
					<ul class="dropdown-menu dropdown-menu-right user-dropdown">
						<li><a href="<?= JText::_('URL_EDIT_PROFILE') ?>"><?= JText::_('USER_EDIT_PROFILE') ?></a></li>
						<li><a id="logoutCustomGeo" href="<?= 'index.php?option=com_users&task=user.logout&' . $userToken . '=1' ?>">Logout</a></li>
					</ul>
					<iframe id="iframe_content_logout" style="display:none;" title="logout"></iframe>
					<script>
						jQuery("#logoutCustomGeo").click(function()
						{
							<?php
							$pathIframe = "/rest/LogoutFromRest";

							$urlComplete = GPT_BASE_URL.$pathIframe;
							?>

							var logoutUrl = '<?php echo $urlComplete;?>';
							var iframe = jQuery('#iframe_content_logout');
							iframe.attr('src',logoutUrl);
						});
					</script>
				<?php } else { ?>
					<a href="<?php echo JRoute::_('index.php?option=com_users&view=login'); ?>" class="accedi">
						<span><?= JText::_('LOGIN') ?></span>
					</a>
				<?php } ?>
			</div>
		</div>
	</div>
</section>
<!-- Fascia Governo & Servizi -->

<div class="logo-header"><!-- sfondo grigio header -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-5">
				<a href="<?php echo JUri::base();?>" title="Vai alla Home" rel="home" id="logo" tabindex="-1">
					<div class="logo">
						<img src="<?php echo $baseurls; ?>images/logo.png" alt="RNDT - Repertorio Nazionale dei Dati Territoriali">
					</div>
				</a>
				<!--div class="info" style="color: white;position: absolute;top: 105px;left: 350px;"><i>description</i><br><a href="#" style="color: white">test</a></div-->
			</div>
			<div class="col-sm-7">
				<div class="row">
					<div class="socialHeaderSection right25 pull-right">
						<div class="floatL">
							<jdoc:include type="modules" name="language" />
						</div>
						<div class="floatL">
							<p><?= JText::_('FOLLOW_US') ?></p>
						</div>

						<?php

						if($link_social = get_field_list('link-social-'.$lang_code))
						{
							foreach($link_social as $nome => $link)
							{
								$icona = (strpos(strtolower($nome), 'rss')!== false) ?  'rss' : strtolower($nome);

								echo '<div class="footer_social clearfix floatL">
											<a class="header_social" href="'.$link.'" title="'.$nome.'" target="_blank">
												<span class="text-center"><i class="fa fa-'.$icona.'"></i></span>
											</a>
									</div>';
							}
						}
						?>
					</div>
				</div>
				<div class="row">
					<div class="right25 pull-right">
						<jdoc:include type="modules" name="search" style="none" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="page-wrapper">
	<div id="page">
		<div id="header">
			<div class="header-inner">
				<div class="region region-navigation">
					<h2 class="block-title">Menu Agenzia</h2>
					<div class="nav nav-controls-site">
						<a href="#menu-main" class="menu-link"><i class="fa fa-bars"></i><span>Menu</span></a>
					</div>
					<jdoc:include type="modules" name="menu" style="none" />
				</div>
			</div>
		</div><!-- /#header -->
