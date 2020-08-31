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

$app = JFactory::getApplication();
$baseUrl = JURI::root();
$baseUrl = strpos($baseUrl, 'https') !== false ? str_replace("https",GENERIC_FORCE_PROTOCOL,$baseUrl): str_replace("http",GENERIC_FORCE_PROTOCOL,$baseUrl);

$baseUrl  = BASE_URL_PROTO;
$baseurls = $baseUrl.'/templates/'.$app->getTemplate().'/';

require_once JPATH_BASE . '/includes/functions.php';
?>
<div class="bgrey">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center">
				<div class="user-login bwhite" style="padding:40px 0">
					<div id="loadingSelectTotal" style="display:none;position: absolute;background: #ddd; width: 100%;margin-top: -40px;height: calc(100% - 40px);z-index:5;text-align: center;padding-top: 30px;">
						<div class="contentLoading">
							<i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
							<span class="sr-only"><?= JText::_('LOADING') ?></span> <?= JText::_('LOADING') ?>
						</div>
					</div>
					<h1><?= ucfirst(strtolower(JText::_('LOGIN'))) ?></h1>
					<p><?= JText::_('LOGIN_LABEL') ?></p>
					
					<div id="credenziali" class="alert alert-danger" role="alert" tabindex="0" style="display:none;"><?= JText::_('WRONG_CREDENTIALS') ?></div>

					<div class="login<?php echo $this->pageclass_sfx; ?>" style="position:relative;">
					
						<?php if ($this->params->get('show_page_heading')) : ?>
						<div class="page-header">
							<h1>
								<?php echo $this->escape($this->params->get('page_heading')); ?>
							</h1>
						</div>
						<?php endif; ?>

						<?php if (($this->params->get('logindescription_show') == 1 && str_replace(' ', '', $this->params->get('login_description')) != '') || $this->params->get('login_image') != '') : ?>
						<div class="login-description">
						<?php endif; ?>

							<?php if ($this->params->get('logindescription_show') == 1) : ?>
								<?php echo $this->params->get('login_description'); ?>
							<?php endif; ?>

							<?php if (($this->params->get('login_image') != '')) :?>
								<img src="<?php echo $this->escape($this->params->get('login_image')); ?>" class="login-image" alt="<?php echo JText::_('COM_USERS_LOGIN_IMAGE_ALT')?>"/>
							<?php endif; ?>

						<?php if (($this->params->get('logindescription_show') == 1 && str_replace(' ', '', $this->params->get('login_description')) != '') || $this->params->get('login_image') != '') : ?>
						</div>
						<?php endif; ?>

						<form id="formLogin" method="post" class="form-validate">

							<fieldset>
                                <?php $count = 0;?>
								<?php foreach ($this->form->getFieldset('credentials') as $field) : ?>
									<?php if (!$field->hidden && $count++==0) : ?>
										<div class="top20">
											<div class="bottom5 left12 bold">
												<?php echo $field->label; ?>
											</div>
											<div class="input-group full-width">
                                                <?php echo $field->input; ?>
											</div>
										</div>
									<?php endif; ?>
								<?php endforeach; ?>

                                <div class="top20">
                                    <div class="bottom5 left12 bold">
                                        <?php echo $field->label; ?>
                                    </div>
                                    <div class="input-group full-width" style="position: relative;">
                                        <input type="password" name="password" id="password" value="" class="validate-password required invalid" size="25" maxlength="99" required="required" aria-required="true" aria-invalid="true">
                                        <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password" style="margin-right: -21px;"></span>
                                    </div>
                                </div>
                                <script>
								
								
                                    jQuery(".toggle-password").mouseup(function() {
										togglePass(this);
									}).mousedown(function() {
										togglePass(this);
									});
									
									function togglePass(that){
										jQuery(that).toggleClass("fa-eye fa-eye-slash");
                                        var input = jQuery(jQuery(that).attr("toggle"));
                                        if (input.attr("type") == "password") {
                                            input.attr("type", "text");
                                        } else {
                                            input.attr("type", "password");
										}
									}
									
                                </script>

								<?php if ($this->tfa): ?>
									<div class="top20">
										<div class="bottom5 left12 bold">
											<?php echo $this->form->getField('secretkey')->label; ?>
										</div>
										<div class="input-group full-width">
                                            <input type="password" name="password" id="password" value="" class="validate-password required invalid" size="25" maxlength="99" required="required" aria-required="true" aria-invalid="true">
                                            <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                        </div>
									</div>
                                <script>
                                    jQuery(".toggle-password").click(function() {

                                        $(this).toggleClass("fa-eye fa-eye-slash");
                                        var input = jQuery(jQuery(this).attr("toggle"));
                                        if (input.attr("type") == "password") {
                                            input.attr("type", "text");
                                        } else {
                                            input.attr("type", "password");
                                        }
                                    });
                                </script>
								<?php endif; ?>
								
								<div class="top20 left12 bold">
									<?php echo JText::_('COM_USERS_LOGIN_RESET'); ?>
									<a href="<?php echo JRoute::_('index.php?option=com_users&view=reset'); ?>"><?php echo JText::_('RECOVER_PASSWORD'); ?></a>
								</div>

								<div class="row top50">
									<div class="col-md-8 col-md-offset-2">
										<button id="loginCustmBTN" type="submit" class="btn bgreen" aria-label="<?= JText::_('LOGIN'); ?>">
											<?php echo JText::_('JLOGIN'); ?>
										</button>
									</div>
								</div>

								<?php if ($this->params->get('login_redirect_url')) : ?>
									<input type="hidden" name="return" value="<?php echo base64_encode($this->params->get('login_redirect_url', $this->form->getValue('return'))); ?>" />
								<?php else : ?>
									<input type="hidden" name="return" value="<?php echo base64_encode($this->params->get('login_redirect_menuitem', $this->form->getValue('return'))); ?>" />
								<?php endif; ?>
								<?php echo JHtml::_('form.token'); ?>
							</fieldset>
						</form>
					</div>
					<div class="top20">
					
						<ul class="nav nav-tabs nav-stacked element-invisible">
							<li>
								
							</li>
							<li>
								<a href="<?php echo JRoute::_('index.php?option=com_users&view=remind'); ?>">
								<?php echo JText::_('COM_USERS_LOGIN_REMIND'); ?></a>
							</li>
							<?php
							$usersConfig = JComponentHelper::getParams('com_users');
							if ($usersConfig->get('allowUserRegistration')) : ?>
							<li>
								<a href="<?php echo JRoute::_('index.php?option=com_users&view=registration'); ?>">
									<?php echo JText::_('COM_USERS_LOGIN_REGISTER'); ?></a>
							</li>
							<?php endif; ?>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row top30 bottom50">
			<div class="col-md-6 col-md-offset-3">
				<div class="row">
					<div class="col-md-12 text-center vcenter45">
						<img class="bottom2" src="<?php echo JUri::base();?>/templates/rndt/images/icons/Back.png" alt="<?= JText::_('BACK') ?>">
						<a class="" href="" title="<?= JText::_('BACK') ?>"><?= JText::_('BACK') ?></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<iframe id="iframe_content2" style="display:none;" title="logout"></iframe>

<iframe id="iframe_content" style="display:block;height:0px;" src='<?php echo GPT_BASE_URL;?>/rest/LogoutFromRest' title="logout"></iframe>
<script> 



<?php
$pathIframe = "/catalog/identity/login.page";

$config = JFactory::getConfig();

$urlComplete1 = BASE_URL_GPT.$config->get('gpt_admin').$pathIframe;
$urlComplete2 = BASE_URL_GPT.$config->get('gpt_public').$pathIframe;
?>
	function callGeportalLogoutService(url){
		var iframe = jQuery('#iframe_content2');
		if ( iframe.length ) {
			iframe.attr('src',url);
		}
		
		jQuery('#logout_form').submit();
		//location.href="<?= JURI::base() ?>";
	}

	var geoportal_login_url = '<?= GPT_BASE_URL ?>/rest/LogoutFromRest';

	callGeportalLogoutService(geoportal_login_url);
	
	var form = jQuery("#formLogin");
	var controlLoginCorrect = false;
	
	jQuery("#loginCustmBTN").click(function(e){
		var dataSend = form.serialize();		
		jQuery("#credenziali").hide();
		jQuery("#loadingSelectTotal").show();
		e.preventDefault();
		jQuery.ajax({
			method: "POST",
			url: "<?php echo JRoute::_('index.php?option=com_users&task=user.login'); ?>",
			data: dataSend
		}).done(function( msg ) {

			controlLoginCorrect = (msg != '0 - Cannot write to log file.');
			if(controlLoginCorrect) controlLoginCorrect = (msg.indexOf("controlLoginCorrect = (msg != '0 - Cannot write to log file.');") == -1);
			
			if(controlLoginCorrect){//ho fatto il login
			
				// Create DOM node (subtree) from the string (but don't append to the document):
				var node = jQuery(msg);
				// Find the messages div:
				var messages = node.children('#login_role_custom_account');
				// Get the contents of the div:

				var control = msg.indexOf("login_role_custom_account");
				var result = control != -1 ? msg.substring(control, control+60).indexOf("true"): "-1";
				var geoportal_login_url = result != -1 ?'<?php echo $urlComplete1;?>':'<?php echo $urlComplete2;?>';

				var iframe = jQuery('#iframe_content');
				iframe.attr('src',geoportal_login_url);
				iframe.attr('title','login');

				window.controlBlock = false;
				window.controlBlock2 = false;
				iframe.on("load", function() {
					if(!window.controlBlock){
						window.controlBlock = true;
						var userN = jQuery("#username")[0].value;
						var userP = jQuery("#password")[0].value;
						//alert("joomla ok chiamo geoportal");
						iframe[0].contentWindow.postMessage(userN+"-"+userP,"*");

						// Create IE + others compatible event handler
						var eventMethod = window.addEventListener ? "addEventListener" : "attachEvent";
						var eventer = window[eventMethod];
						var messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message";

						var controlReturn = false;
						// Listen to message from child window
						eventer(messageEvent,function(e) {
                            if(!window.controlBlock2){
                                window.controlBlock2 = true;
                                controlReturn = true;
                                if(jQuery("#password")[0].value.startsWith("pass_")){
                                    location.href = location.origin+location.pathname.split("/login")[0]+"/modifica-profilo?mod_pass=1";
                                }else{
                                    location.href = location.origin+location.pathname.split("/login")[0];
                                }

                            }

						},false);

					}
				});
			}else{
				jQuery("#credenziali").show();
				jQuery("#loadingSelectTotal").hide();
			}
			

			
		});
		
		
		
		
		
	});	
	
	
</script>


<?php

/**
	se settati questa variabile di sessione cambiano la pagina della guida
*/
$_SESSION['guida_url_page'] = 4;

?>
