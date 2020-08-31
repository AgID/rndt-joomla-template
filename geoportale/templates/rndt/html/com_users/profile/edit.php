<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_users
 *
 * @copyright   Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

require_once JPATH_BASE . '/includes/functions.php';
require_once JPATH_BASE . '/includes/LdapCustom.php';

//JHtml::_('behavior.keepalive');
//JHtml::_('behavior.formvalidator');
//JHtml::_('formbehavior.chosen', 'select');

$baseUrl = JURI::root();
$baseUrl = strpos($baseUrl, 'https') !== false ? str_replace("https",GENERIC_FORCE_PROTOCOL,$baseUrl): str_replace("http",GENERIC_FORCE_PROTOCOL,$baseUrl);


define('BASE_URL_PROTO', $baseUrl);

// Load user_profile plugin language
$lang = JFactory::getLanguage();
//$lang->load('plg_user_profile', JPATH_ADMINISTRATOR);

$app = JFactory::getApplication();
$baseUrl  = BASE_URL_PROTO;
$baseurls = $baseUrl.'/templates/'.$app->getTemplate().'/';

function getByURL($url, $debug = false){
    if($debug) echo "<br>DEBUG -> ".$url;
    $opts = array(
        'http'=>array(
            'method'=>"GET",
            'header'=>"Accept-language: en\r\n" .
                "Cookie: foo=bar\r\n"
        )
    );

    $context = stream_context_create($opts);
    $html = file_get_contents($url,false,$context);

    $json = preg_replace('/,\s*([\]}])/m', '$1', $html);
    $json = json_decode($json,true);
    return $json;
}
?>

<form action="" method="post" >
    <?php

    $user = JFactory::getUser();

    if($_POST){
        $error = array();


        if(!empty($_POST['password1'])){
            if($_POST['password1'] != $_POST['password2']){
                array_push($error, JText::_('COM_USERS_FIELD_RESET_PASSWORD1_MESSAGE'));
            }
        }

        if(!empty($_POST['email1'])){
            if($_POST['email1'] != $_POST['email2']){
                array_push($error, JText::_('COM_USERS_PROFILE_EMAIL2_MESSAGE'));
            }
        }

        if($_POST['id'] != $user->id){
            array_push($error,"L'id non coincide");
        }
		
        if(count($error) == 0){
            //$user = $user->getInstance($_POST['id']);
            if(empty($user->name)) $user->name = $_POST['name'];
            if(empty($user->username)) $user->username = $_POST['username'];
            if(!empty($_POST['password1'])) $user->password = JUserHelper::hashPassword($_POST['password1']);
            if(empty($user->email) && !empty($_POST['email1'])) $user->email = $_POST['email1'];


            $ldap = new LdapCustom();
            $result = $ldap->getUser($user->username);//$ldap->getUser($_POST['id']);

            if(!empty($result['cn'])):
                $arraySend = array(
                    "id-user" => $_POST['id'],
                    //"displayname" => $_POST['name'], //Bug 189
                    //"uid" => $_POST['name'], // @author paolo martufi 2017-07-06
                    "cn" => $result['cn'],
                    "userPassword" => $_POST['password1'],
                    //"mail" => $_POST['email1'],
                    "type_form" => 1,
                    "title" => $_POST['title'],
                    "businessCategory" => $_POST['businessCategory'],
                    "labeledURI" => $_POST['labeledURI'],
                    "street" => $_POST['street'],
                    "telephoneNumber" => $_POST['telephoneNumber'],
                    "st" => $_POST['st'],
                    "l" => $_POST['l']
                );

                $ldap = $ldap->writePerson($arraySend);
                $user->save(true);
                $message = '<span class="alert alert-success messageCustom" role="alert" tabindex="0">'.JText::_('COM_USERS_PROFILE_SAVE_SUCCESS').'</span>';

            else:
                $message = '<span class="alert alert-danger messageCustom" role="alert" tabindex="0">'.JText::_('USER_NOT_FOUND').'</span>';
            endif;


        }else{

            $message = '<span class="alert alert-danger messageCustom" role="alert" tabindex="0">';
            foreach ($error as $item){
                $message .=$item.'</br>';
            }
            $message .='</span>';

        }


    }

    $ldap = new LdapCustom();
    $result = $ldap->getUser($user->username);//$ldap->getUser($_POST['id']);

    //$user->name = $result['displayname']; // Bug 189
    $user->dn = $result['dn']; // @author paolo martufi 2017-07-06
    if(empty($user->name)) $user->name = $result['uid']; // @author paolo martufi 2017-07-06
    if(empty($user->email)) $user->email = $result['mail'];//era $user->mail
    $user->title = isset($result['title']) ? $result['title'] : null;
    $user->businessCategory = isset($result['businesscategory']) ? $result['businesscategory'] : null;
    $user->labeledURI = isset($result['labeleduri']) ? $result['labeleduri'] : null;
    $user->street = isset($result['street']) ? $result['street'] : null;
    $user->telephoneNumber = isset($result['telephonenumber']) ? $result['telephonenumber'] : null;
    $user->st = isset($result['st']) ? $result['st'] : null;
    $user->l = isset($result['l']) ? $result['l'] : null;
    $user->o = isset($result['o']) ? $result['o'] : null;

    if(!empty($user->dn)){
        $ente = $ldap->getEnte($user->dn, "uniquemember");

        if(!empty($ente)){
            $urlAllTypeServer = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/getAllType";
            $arraySearch = getByURL($urlAllTypeServer);

            $itemFound = null;
            foreach ($arraySearch as $item){
                if($item['codice'] == $ente['o']){
                    $itemFound = $item;
                    break;
                }
            }

            $ente["type"] = $itemFound['nome'];
            if($ente["owner"]){
                $ente["responsabile"] = $ldap->getUser(str_replace("cn=","",explode(",",$ente["owner"])[0]));
            }
        }


    }

    //mettere ente di appartenenza, ruolo, dati della pa e il responsabile PA
 
    ?>
    <div class="bgrey">
        <div class="container">
            <?php if(!empty($message)):?>
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <?php echo $message;?>
                    </div>
                </div>
            <?php endif;?>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="user-login bwhite">

                        <h1><?= JText::_('COM_USERS_PROFILE_MY_PROFILE') ?></h1>

                        <?php if(!empty($_GET['mod_pass']) && empty($_POST)):?>

                            <div class="container-fluid alert alert-danger">
                                <div class="row">
                                    <div class="col-md-12">
                                        Attenzione è necessario modificare la password!
                                    </div>
                                </div>
                            </div>

                        <?php endif;?>

                        <div class="top20">
                            <fieldset>
                                <legend>
                                    <?= JText::_('COM_USERS_PROFILE_DEFAULT_LABEL') ?> <?= JText::_('USERNAME_VALIDATION_HINT_MSG')?>
                                </legend>
                                <input type="hidden" name="id" id="jform_id" value="<?php echo $user->id;?>">

                                <div class="container-fluid">
                                    <div class="col-md-6">
                                        <div class="top20">
                                            <div class="input-group full-width">
                                                <label id="jform_name-lbl" for="jform_name" class="hasPopover required" title="" data-content="<?= JText::_('COM_USERS_PROFILE_NAME_DESC') ?>" data-original-title="Nome" aria-invalid="false">
                                                    <?= JText::_('COM_USERS_PROFILE_NAME_LABEL') ?><span class="star">&nbsp;*</span>
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="text" name="name" id="jform_name" value="<?php echo $user->name;?>" class="form-control required" readonly="" size="30" required="required" aria-required="true" aria-invalid="false">
                                            </div>
                                        </div>
                                        <div class="top20">
                                            <div class="input-group full-width">
                                                <label id="jform_username-lbl" for="jform_username" class="hasPopover" title="" data-content="<?= JText::_('COM_USERS_PROFILE_NOCHANGE_USERNAME_DESC') ?>" data-original-title="<?= JText::_('COM_USERS_PROFILE_USERNAME_LABEL') ?>">
                                                    <?= JText::_('COM_USERS_PROFILE_USERNAME_LABEL') ?>
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="text" name="username" id="jform_username" value="<?php echo $user->username;?>" size="30" readonly="" class="form-control full-width">
                                            </div>
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
                                                <label id="jform_email1-lbl" for="jform_email1" class="hasPopover required" title="" data-content="<?= JText::_('COM_USERS_PROFILE_EMAIL1_DESC') ?>" data-original-title="<?= JText::_('COM_USERS_PROFILE_EMAIL1_LABEL') ?>">
                                                    <?= JText::_('COM_USERS_PROFILE_EMAIL1_LABEL') ?><span class="star">&nbsp;*</span>
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="email" name="email1" class="form-control validate-email required" id="jform_email1" readonly="" value="<?php echo $user->email;?>" size="30" autocomplete="email" required="required" aria-required="true">											</div>
                                        </div>
                                        <div class="top20" style="display: none;">
                                            <div class="input-group full-width">
                                                <label id="jform_email2-lbl" for="jform_email2" class="hasPopover required" title="" data-content="<?= JText::_('COM_USERS_PROFILE_EMAIL2_DESC') ?>" data-original-title="<?= JText::_('COM_USERS_PROFILE_EMAIL2_LABEL') ?>">
                                                    <?= JText::_('COM_USERS_PROFILE_EMAIL2_LABEL') ?><span class="star">&nbsp;*</span>
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="email" name="email2" class="form-control validate-email required" id="jform_email2" value="<?php echo $user->email;?>" size="30" required="required" aria-required="true">											</div>
                                        </div>


                                        <div class="top20">
                                            <div class="input-group full-width">
                                                <label for="jform_title" class="hasPopover" title="">
                                                    Titolo
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="text" name="title" class="form-control"  id="jform_title" value="<?php echo $user->title;?>" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="top20">
                                            <div class="input-group full-width">
                                                <label for="jform_businessCategory" class="hasPopover" title="">
                                                    Settore
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="text" name="businessCategory" class="form-control"  id="jform_businessCategory" value="<?php echo $user->businessCategory;?>" >
                                            </div>
                                        </div>
                                        <div class="top20">
                                            <div class="input-group full-width">
                                                <label for="jform_labeledURI" class="hasPopover" title="">
                                                    Sito web
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="text" name="labeledURI" class="form-control"  id="jform_labeledURI" value="<?php echo $user->labeledURI;?>" >
                                            </div>
                                        </div>
                                        <div class="top20">
                                            <div class="input-group full-width">
                                                <label for="jform_telephoneNumber" class="hasPopover" title="">
                                                    Telefono
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="text" name="telephoneNumber" class="form-control"  id="jform_telephoneNumber" value="<?php echo $user->telephoneNumber;?>" >
                                            </div>
                                        </div>
                                        <div class="top20">
                                            <div class="input-group full-width">
                                                <label for="jform_street" class="hasPopover" title="">
                                                    Indirizzo
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="text" name="street" class="form-control"  id="jform_street" value="<?php echo $user->street;?>" >
                                            </div>
                                        </div>
                                        <div class="top20">
                                            <div class="input-group full-width">
                                                <label for="jform_st" class="hasPopover" title="">
                                                    Provincia
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="text" name="st" class="form-control"  id="jform_st" value="<?php echo $user->st;?>" >
                                            </div>
                                        </div>
                                        <div class="top20">
                                            <div class="input-group full-width">
                                                <label for="jform_l" class="hasPopover" title="">
                                                    Comune
                                                </label>
                                            </div>
                                            <div class="input-group full-width">
                                                <input type="text" name="l" class="form-control"  id="jform_l" value="<?php echo $user->l;?>" >
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <?php if(!empty($ente)):?>
                                    <h3 style="margin-top: 35px;">Ente di appartenenza</h3>
                                    <div class="container-fluid">
                                        <div class="col-md-6">
                                            <div class="top20">
                                                <div class="input-group full-width">
                                                    <label for="jform_l" class="hasPopover" title="">
                                                        Codice ipa
                                                    </label>
                                                </div>
                                                <div class="input-group full-width">
                                                    <input type="text" class="form-control"  readonly="" value="<?php echo $ente['cn'];?>" >
                                                </div>
                                            </div>
                                            <div class="top20">
                                                <div class="input-group full-width">
                                                    <label for="jform_l" class="hasPopover" title="">
                                                        Tipo ente
                                                    </label>
                                                </div>
                                                <div class="input-group full-width">
                                                    <input type="text" class="form-control"  readonly="" value="<?php echo $ente['type'];?>" >
                                                </div>
                                            </div>
                                            <div class="top20">
                                                <div class="input-group full-width">
                                                    <label for="jform_l" class="hasPopover" title="">
                                                        Responsabile
                                                    </label>
                                                </div>
                                                <div class="input-group full-width">
                                                    <input type="text" class="form-control"  readonly="" value="<?php echo $ente['owner'] ? $ente["responsabile"]['uid']:"";?>" >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="top20">
                                                <div class="input-group full-width">
                                                    <label for="jform_l" class="hasPopover" title="">
                                                        Nome ente
                                                    </label>
                                                </div>
                                                <div class="input-group full-width">
                                                    <input type="text" class="form-control"  readonly="" value="<?php echo $ente['ou'];?>" >
                                                </div>
                                            </div>

                                            <div class="top20">
                                                <div class="input-group full-width">
                                                    <label for="jform_l" class="hasPopover" title="">
                                                        Il tuo ruolo
                                                    </label>
                                                </div>
                                                <div class="input-group full-width">
                                                    <input type="text" class="form-control"  readonly="" value="<?php echo $ente['owner'] == $user->dn ? "Riferimento": "Utente";?>" >
                                                </div>
                                            </div>

                                            <div class="top20">
                                                <div class="input-group full-width">
                                                    <label for="jform_l" class="hasPopover" title="">
                                                        Email del responsabile
                                                    </label>
                                                </div>
                                                <div class="input-group full-width">
                                                    <input type="text" class="form-control"  readonly="" value="<?php echo $ente['owner'] ? $ente["responsabile"]['mail']:"";?>" >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php endif;?>

                            </fieldset>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row top30 bottom50">
                <div class="col-md-6 col-md-offset-3">
                    <div class="row">
                        <div class="col-md-6 text-center vcenter45">
                            <img class="bottom2" src="<?php echo JUri::base();?>/templates/rndt/images/icons/Back.png" alt="<?= JText::_('JCANCEL') ?>">
                            <a class="" href="<?= JURI::root() ?>" title="<?php echo JText::_('JCANCEL'); ?>"><?php echo JText::_('JCANCEL'); ?></a>
                        </div>

                        <div class="col-md-5">
                            <div class="input-group full-width">
                                <button id="jform_submit" aria-label="<?php echo JText::_('JAPPLY'); ?>" type="submit" class="btn bgreen"><?php echo JText::_('JSUBMIT'); ?></button>
                            </div>
                        </div>
                    </div>
                </div>

                <?php echo JHtml::_('form.token'); ?>
            </div>
        </div>
</form>
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

<?php


/**
	se settati questa variabile di sessione cambiano la pagina della guida
*/
$_SESSION['guida_url_page'] = 3;

?>
