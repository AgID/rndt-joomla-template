<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_users
 *
 * @copyright   Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;


require_once JPATH_BASE . '/includes/functions.php';
require_once JPATH_BASE . '/includes/LdapCustom.php';
//JHtml::_('behavior.keepalive');
//JHtml::_('behavior.formvalidator');

$app = JFactory::getApplication();
$userId = $app->getUserState('com_users.reset.user', null);



	$user = JFactory::getUser($userId);

	if($_POST){
		$error = array();


		if(!empty($_POST['password1'])){
			if($_POST['password1'] != $_POST['password2']){
				array_push($error, JText::_('COM_USERS_FIELD_RESET_PASSWORD1_MESSAGE'));
			}
		}


		if($_POST['id'] != $user->id){
			array_push($error,"L'id non coincide");
		}
		//var_dump($user);
		if(count($error) == 0){
			
			//$user = $user->getInstance($_POST['id']);
			if(!empty($_POST['password1'])) $user->password = JUserHelper::hashPassword($_POST['password1']);

		//var_dump($user->password);

			$ldap = new LdapCustom();
			$result = $ldap->getUser($_POST['username']);//$ldap->getUser($_POST['id']);

			if(!empty($result['cn'])){

				$arraySend = array(
					"id-user" => $_POST['id'],
                    "uid" => $result['uid'], // @author paolo martufi 2017-07-06
                    "cn" => $result['cn'],
                    "userPassword" => $_POST['password1'],
                    "mail" => $result['email1'],
                    "type_form" => 1,
                    "title" => $result['title'],
                    "businessCategory" => $result['businessCategory'],
                    "labeledURI" => $result['labeledURI'],
                    "street" => $result['street'],
                    "telephoneNumber" => $result['telephoneNumber'],
                    "st" => $result['st'],
                    "l" => $result['l']
                    
					
				);

				$ldap = $ldap->writePerson($arraySend);
				$user->block = 0;//activation
				$user->save(true);
				$message = '<span class="alert alert-success messageCustom" role="alert" tabindex="0">'.JText::_('COM_USERS_PROFILE_SAVE_SUCCESS').'</span>';

			}else{
				$message = '<span class="alert alert-danger messageCustom" role="alert" tabindex="0">'.JText::_('USER_NOT_FOUND').'</span>';
			}


		}else{

			$message = '<span class="alert alert-danger messageCustom" role="alert" tabindex="0">';
			foreach ($error as $item){
				$message .=$item.'</br>';
			}
			$message .='</span>';

		}


	}?>

<div class="bgrey">
	<div class="container-fluid">
		<?php if(!empty($message)):?>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<?php echo $message;?>
				</div>
			</div>
		<?php endif;?>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="user-login bwhite">

					<div class="reset-complete<?php echo $this->pageclass_sfx; ?>">
						<?php if ($this->params->get('show_page_heading')) : ?>
							<div class="page-header">
								<h1>
									<?php echo $this->escape($this->params->get('page_heading')); ?>
								</h1>
							</div>
						<?php endif; ?>
						
						<form action="" method="post" >
							
							 <input type="hidden" name="id" id="jform_id" value="<?php echo $user->id;?>">
							 <input type="hidden" name="username" id="jform_id" value="<?php echo $user->username;?>">
							 
		
								<div class="top20">
									
									<div class="input-group full-width">
										<label id="jform_password1-lbl" for="jform_password1" class="hasPopover" title="" data-content="<?= JText::_('COM_USERS_DESIRED_PASSWORD') ?>" data-original-title="<?= JText::_('COM_USERS_PROFILE_PASSWORD1_LABEL') ?>">
											<?= JText::_('COM_USERS_PROFILE_PASSWORD1_LABEL') ?>
										</label>
										<span class="validation-error-msg" id="password-validation-error-msg"><?= JText::_('PASSWORD_VALIDATION_ERROR_MSG')?></span>
									</div>
									<div class="input-group full-width">
										<input type="password" style="display:none">
										<input type="password" name="password1" id="jform_password1" value="" autocomplete="off" class="form-control  validate-password" size="30" maxlength="99">
									</div>

								</div>
								<div class="top20">
									<div class="input-group full-width">
										<label id="jform_password2-lbl" for="jform_password2" class="hasPopover" title="" data-content="<?= JText::_('COM_USERS_PROFILE_PASSWORD2_DESC') ?>" data-original-title="<?= JText::_('COM_USERS_PROFILE_PASSWORD2_LABEL') ?>">
											<?= JText::_('COM_USERS_PROFILE_PASSWORD2_LABEL') ?>
										</label>
									</div>
									<div class="input-group full-width">
										<input type="password" name="password2" id="jform_password2" value="" autocomplete="off" class="form-control validate-password" size="30" maxlength="99">
									</div>
								</div>
								<div class="top20">
									<div class="input-group full-width">
										<button id="jform_submit" aria-label="<?php echo JText::_('JAPPLY'); ?>" type="submit" class="btn bgreen"><?php echo JText::_('JSUBMIT'); ?></button>
									</div>
								</div>
								
								
							</form>
					</div>

				</div>
			</div>
		</div>
		<div class="row top30 bottom50"></div>
	</div>
</div>
<script>
    /*
     * Bug 151
     * Il campo Password permette l'inserimento di qualsiasi tipo di carattere,
     * mentre sono ammessi solo gli alpanumeri e _
     *
     * FIX
     * Controllo sull'input e confronto con l'epressione regolare
     */
    function validatePassword(){
        var re = /^[a-zA-Z0-9_]*$/;
        var validation = re.test(jQuery('#jform_password1').val());
        return validation;
    }

    jQuery('#jform_password1').keyup(function(e){
        //console.log(validation);
        if(!validatePassword()){
            jQuery('#password-validation-error-msg').show();
        }
        else{
            jQuery('#password-validation-error-msg').hide();
        }
    });

    jQuery('#jform_submit').click(function(e){
        if(!validatePassword()){
            alert("<?= JText::_('PASSWORD_VALIDATION_ERROR_MSG')?>");
            e.preventDefault();
        }
    });
</script>
<style>

    .messageCustom{
        margin-top: 25px;
        display: block;
        margin-bottom: 0px;
    }
    .user-login{
        margin-top: 50px!important;
    }

    input:read-only {
        background-color: #ccc!important;
    }

    .validation-error-msg{
        display: none;
        color: red;
    }
</style>