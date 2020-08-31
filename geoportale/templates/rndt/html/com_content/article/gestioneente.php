<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');
require_once JPATH_BASE . '/includes/functions.php';
require_once JPATH_BASE . '/includes/LdapCustom.php';

$urlAllType = GPT_BASE_URL."/rest/RestUserAddOn/getAllType";
$urlAllTypeServer = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/getAllType";
$urlAllPA = GPT_BASE_URL_SERVER."/rest/RestUserAddOn/getAllPA";
$urlAllPAClient = GPT_BASE_URL."/rest/RestUserAddOn/getAllPA";



$auth_id = JFactory::getApplication()->get('auth_id');
$url_WS05 = JFactory::getApplication()->get('url_WS05');
$url_WS16 = JFactory::getApplication()->get('url_WS16');



$controlMod = !empty($_GET['cnPA']) ? $_GET['cnPA'] : null;
$idPa = $_GET['idPa'];
$controlInsert = !empty($_POST['insert']) ? $_POST['insert'] : false;

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

function getByURL_POST($url, $post, $debug = false){


$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $post);

// execute!
$response = curl_exec($ch);

// close the connection, release resources used
curl_close($ch);

// do anything you want with your response
//var_dump($response);
return $response;
}

/** update type_form = 1
 *  insert type_form = 2 */
if(!empty($_POST['type_form'])){
    $ldap = new LdapCustom();

    /*
     * FIX: Bug 197
     * @author paolo martufi 2017-07-07
     *
        $ldap = $ldap->writeEnte($_POST);
     */
    $ldap_response = $ldap->writeEnte($_POST);
    $strCompleteOperation = JText::_('ORGANIZATION_ADDED');
    if($_POST['type_form'] == 1){
        $strCompleteOperation = JText::_('ENTE_MODIFIED');
    }else if($_POST['type_form'] == 2){
        $strCompleteOperation = JText::_('ENTE_CREATED');
    }
}

$uri = JFactory::getURI();

$returnAnnulla = explode("?",$uri->toString());

$returnAnnulla = $returnAnnulla[0];


?>
<div class="container paddingCustom bottom50">
    <div class="row">
        <div class="col-md-12">
            <h2 class="subtitle_custom"><?= JHtml::_('content.prepare', '{loadmodule breadcrumbs}') ?></h2>

            <h1 class="title_custom">
                <?php if(!empty($controlMod) && empty($strCompleteOperation)):?>
                    <?= JText::_('ENTE_MODIFY') ?>
                <?php elseif($controlInsert && empty($strCompleteOperation)): ?>
                    <?= JText::_('ORGANIZATION_CREATE') ?>
                <?php else: ?>
                    <?= $this->escape($this->item->title) ?>
                <?php endif; ?>
            </h1>

            <?php if($ldap_response['error'] == false && !empty($strCompleteOperation)):?>

                <div class="container-fluid alert alert-success">
                    <div class="row">
                        <div class="col-md-12">
                            <?php echo $strCompleteOperation;?>
                        </div>
                    </div>
                </div>

            <?php endif;?>

            <?php
            /*
             * FIX Bug 197
             * @author paolo martufi
             */
            if($ldap_response['error'] == true):?>

                <div class="container-fluid alert alert-danger">
                    <div class="row">
                        <div class="col-md-12">
                            <?php echo $ldap_response['error_msg'];?>
                        </div>
                    </div>
                </div>

				
				
            <?php endif;?>
			
				<div id="erroreWS" class="container-fluid alert alert-danger" style="display:none;">
                    <div class="row">
                        <div id="erroreWSinner" class="col-md-12">
                           
                        </div>
                    </div>
                </div>

						<div id="erroreWS16" class="container-fluid alert alert-danger" style="display:none;">
                    <div class="row">
                        <div id="erroreWS16numItems" class="col-md-12">
                           
                        </div>
                    </div>
                </div>

				
				
        
            <?php if((empty($controlMod) && empty($controlInsert)) || !empty($strCompleteOperation)):?>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <button id="buttonModal" type="button" class="btn btn-default btn-custom" data-toggle="modal" data-target="#modificaEnte"><?= JText::_('ENTE_MODIFY') ?></button>
                        </div>
                        <div class="col-md-6">
                            <form method="POST">
                                <input type="hidden" name="insert" value="1">
                                <button type="submit" class="btn btn-default btn-custom" ><?= JText::_('ORGANIZATION_CREATE') ?></button>
                            </form>
                        </div>
                    </div>
                    <!-- Modal -->
                    <div id="modificaEnte" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title"><?= JText::_('ENTE_MODIFY') ?></h4>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">

                                        <form class="row"  method="GET" autocomplete="off">
                                            <input type="hidden" id="id_tipo2" name="idPa" value="">
                                            <input type="hidden" id="cnPA2" name="cnPA" value="">
                                            <div class="form-group col-md-6 customLabel">
                                                <label for="id_pa_search_text"><?= JText::_('SEARCH_BY_ORGANIZATION') ?></label>
                                                <input type="text" id="id_pa_search_text" class="form-control form-controlCustom" name="Ente" onkeyup="showResultPa(this.value)" value="<?php echo !empty($_POST['pa_search']) && empty($strCompleteOperation) ? $_POST['pa_search'] : "";?>">

                                                <div id="livesearch2"></div>
                                            </div>

                                            <div class="col-md-12">
                                                <button type="submit" id="sendButtonSearch" class="btn btn-default btn-custom"><?= JText::_('SEARCH') ?></button>
                                            </div>


                                        </form>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal"><?= JText::_('CLOSE') ?></button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            <?php else:?>
                <?php

                $user = array();
                if(!empty($controlMod)):

                    $ldap = new LdapCustom();

                    $result = $ldap->getEnte($controlMod);

                    //$result = $ldap->searchEnte($controlMod);
					$arraySearch = getByURL($urlAllTypeServer);

                    $itemFound = null;
                    foreach ($arraySearch as $item){
                        if($item['codice'] == $result['o']){
                            $itemFound = $item;
                        }
                    }


                    // if(empty($result['displayName'])) $result['displayName'] = trim(str_replace( $result['sn'], "", $result['uid']));

                endif;
                ?>
                <div class="container-fluid">

                    <?php $actual_link = explode("?",$_SERVER[REQUEST_URI]);?>

                    <div class="container-fluid">
					
					
					
                        <form id="form-update-ente" class="row" action="<?php echo $actual_link[0];?>" method="POST" >
						
                            <?php if(!empty($result['dn'])):?><input type="hidden" name="dn" value="<?php echo $result['dn'];?>"><?php endif;?>
                            <?php if(!empty($controlMod)):?>
                                <input type="hidden" name="id-ente" value="<?php echo $controlMod;?>">

                                <input type="hidden" name="type_form" value="1">
                                <input type="hidden" name="idPa" value="<?php echo $idPa;?>">
                            <?php elseif($controlInsert): ?>
                                <input type="hidden" name="type_form" value="2">
                            <?php endif; ?>
							
							
							   
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="nome-input"><?= JText::_('IPA_CODE') ?> * <span class="validation-error-msg" id="cn-validation-error-msg"><?= JText::_('IPA_VALIDATION_ERROR_MSG')?></span></label>
                                    <input type="hidden" class="form-control form-controlCustom" name="cn_ex" value="<?php echo $result['cn'];?>" required>
                                    <input type="text" class="form-control form-controlCustom" id="cn" name="cn" value="<?php echo $result['cn'];?>" required>
                                </div>
								
								 <!-- </div> -->
                                <div class="form-group">
                                    <label for="nome-input"><?= JText::_('ORGANIZATION_NAME') ?> *</label>
									<input type="text" class="form-control form-controlCustom" id="ou" name="ou" value="<?php echo $result['ou'];?>" >
									 <!-- <i class="fa fa-search" id="buttonLente" aria-hidden="true"></i> -->
									  
							
									 <select id="select_ente" name="select_ente" class="form-control form-controlCustom" style="display:none;"></select>
								</div>
							    
							
                                <div class="contentLoading">
                                        <i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
                                        <span class="sr-only">Loading...</span> <?= JText::_('LOADING') ?>
                                </div>
                           
                                <div class="form-group">
                                    <button id="sendButton" type="submit" class="btn btn-default btn-custom buttonCustomGest">

                                        <?php if(!empty($controlMod) && empty($strCompleteOperation)):?>
                                            <?= JText::_('ENTE_MODIFY') ?>
                                        <?php elseif($controlInsert && empty($strCompleteOperation)): ?>
                                            <?= JText::_('ORGANIZATION_CREATE') ?>
                                        <?php endif;?>
                                    </button>
                                    <a href="<?php echo $returnAnnulla;?>" class="btn btn-default btn-custom buttonCustomGest buttonCustomGestLine" ><?= JText::_('ANNULLA') ?></a>
                                    <div class="contentLoading">
                                        <i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
                                        <span class="sr-only">Loading...</span> <?= JText::_('LOADING') ?>
                                    </div>
                                </div>
                      
                    </div> 
					
					<div class="col-md-6">
							<div class="form-group">
									  
                                <label for="id_pa_search_text"><?= JText::_('ORGANIZATION_TYPE') ?> *</label>
                                <input type="text" id="tipo" class="form-control form-controlCustom" name="tipo" onkeyup="showResult(this.value)" value="<?php echo $itemFound['nome'];?>"  autocomplete="off">
                                <input type="hidden" id="id_tipo" name="o" value="<?php echo $result['o'];?>">
								  <div id="livesearch"></div>
                                
							</div>
							<div class="form-group">
							
								
									
							    <i class="fa fa-search" id="buttonLente" style="margin-top: 23px" aria-hidden="true"></i>
							 </div>
					   </div>
  </form>
					
            <?php endif;?>

        </div>
    </div>
</div>





							  
<script>

	jQuery("#cn").keyup(function() {
		controlSendButton(false)
	});
	
	jQuery("#ou").keyup(function() {
		controlSendButton(false)
	});
	
	jQuery("#tipo").keyup(function() {
		controlSendButton(false)
	});


</script>

<script>
		//jQuery("#buttonCompila").click(function(e){
		/*	var params= {
										'AUTH_ID' : '<?php echo $auth_id;?>',
										'COD_AMM' : ipa
									};			*/	
									
    	jQuery("input[name='cn']").click(function(e){
		e.preventDefault();
		e.stopPropagation();
		compilaCampilaCampiDaIpa();
		
			jQuery("input[name='cn']").change(function(e){
			e.preventDefault();
			e.stopPropagation();
			compilaCampilaCampiDaIpa();
		
			});
		});

</script>



<script>
function compilaCampilaCampiDaIpa(){
	
	jQuery("input[name='ou']").val("");
		jQuery("input[name='tipo']").val("");
		//jQuery("input[name='select_ente']").val("");
		jQuery("#select_ente").html('');//svuoto select
		jQuery("#ou").show();
		jQuery("#select_ente").hide();
		jQuery("#erroreWS").hide();
	    jQuery("#erroreWS16").hide();
		
		
		var ipa = jQuery("input[name='cn']").val();
							
			if(ipa && ipa !==""){
				
			callWS_05('<?php echo $auth_id;?>','<?php  echo $url_WS05; ?>',ipa);

			}
		}


</script>

<script>
	jQuery("#buttonLente").click(function(e){
	//jQuery("input[name='ou']").change(function(e){
		e.preventDefault();
		e.stopPropagation();
		jQuery("input[name='tipo']").val("");
		jQuery("input[name='cn']").val("");
		
		jQuery("#erroreWS").hide();
		jQuery("#erroreWS16").hide();
		
		var nomeEnteInput = jQuery("input[name='ou']").val();
				
		callWS_16('<?php echo $auth_id;?>','<?php  echo $url_WS16; ?>',nomeEnteInput);

	});

</script>

<script>

function controlSendButton(control){
	if(control){
		jQuery('#sendButton').attr("disabled", false);
	
	}else{
		jQuery("#sendButton").attr("disabled", true);
		
	}
	
	
}
</script>
<script>
 function callWS_16(auth_id, url_WS,nomeEnteInput) {


		jQuery.ajax({
				url: '<?php  echo $url_WS16; ?>',
				data:{
					'AUTH_ID' : '<?php echo $auth_id;?>',
					'DESCR' : nomeEnteInput
				},
				method: "POST"
			}).done(function( data ) {
				
				jQuery("#select_ente").html('');//svuoto select
						//jQuery("#ou").hide();
				
				
				//console.log(data);
			var desc_err = data.desc_err;
				
			if(data && data.cod_err && data.cod_err == 0  ){
			
			jQuery("#erroreWS").show(); 
			jQuery("#erroreWS").text("Errore di chiamata al servizio IPA: " + desc_err);
			
		}
		
		else if(data && data.cod_err && data.cod_err != 0 && data.num_items <= 3 ){
			
			console.log("Errore di chiamata al servizio 16");
			
			jQuery("#erroreWS16").show(); 
			jQuery("#erroreWS16numItems").text("Errore di chiamata al servizio IPA: " + desc_err);
			
		}
		
		else if(data && data.data && data.data.length != 0){
					
					jQuery("#select_ente").append(jQuery("<option>",{"value":"-1","text":"Seleziona risultati"}));
					for(var i=0; i< data.data.length;i++){
						var item = data.data[i];
						jQuery("#select_ente").append(jQuery("<option>",{"value":item.cod_amm,"text":item.des_amm}));
					}
					jQuery("#select_ente").show();//faccio vedere select
					
					jQuery("#select_ente").change(function(e){
						jQuery("#select_ente").hide();
						
						var codipa = jQuery(this).val();
						
						if(codipa == "-1") return;
						jQuery("input[name='cn']").val(codipa);
						
						if(codipa && codipa !==""){

						callWS_05('<?php echo $auth_id;?>','<?php  echo $url_WS05; ?>',codipa);
						}
					});
				}
				
			  });

  }
</script>

<script>
 function callWS_05(auth_id, url_WS,ipa) {
	 						

	 jQuery.ajax({
		  url: '<?php  echo $url_WS05; ?>',
			data:{
				'AUTH_ID' : '<?php echo $auth_id;?>',
				'COD_AMM' : ipa
			},
			method: "POST"
		}).done(function( data ) {
		
			console.log("cod_err:");
			var cod_err = data.cod_err;
			console.log(cod_err);
			
			
		   if(data && data.cod_err && data.cod_err != 0  ){
				var desc_err = data.desc_err;
				console.log("Errore di chiamata al servizio 05");
			
				jQuery("#erroreWS").show();
				jQuery("#erroreWSinner").text("Errore nella chiamata al servizio IPA: "+desc_err);
				controlSendButton(false);
			}
			else if(data.num_items == 0  ){
				jQuery("#erroreWS").show();
				jQuery("#erroreWSinner").text("Nessun risultato per il Codice ipa inserito.");
				controlSendButton(false);
				
			}
			else if(data && data.data && data.data.length != 0){
			
			if(data && data.data){
				controlSendButton(true);
				jQuery("input[name='ou']").val(data.data.des_amm);
				jQuery("input[name='tipo']").val(data.data.categoria);
				jQuery("input[name='cn']").val(data.data.cod_amm);
					}
				  };
			}) 

 }
</script>



<script>
    var debug = true;
    var maxResultSearch  = 100;
    var resultMatch = 0;
    function showResult(str) {
        if (str.length>=3) {
            jQuery("#livesearch").empty();

            jQuery.get( "<?php echo $urlAllType;?>?nome="+str, function( data ) {
                var dataParse = JSON.parse(data);
                var arraySup = [];
                resultMatch = 0;
                if(dataParse.length != 0){
                    jQuery.each(dataParse, function( i,item ) {
                        if(maxResultSearch >= i && item.nome.toLowerCase().indexOf(str.toLowerCase()) != -1){//item.nomePA.toLowerCase().indexOf(str.toLowerCase()) != -1 &&
                            arraySup.push(item);

                            var textDiv = jQuery('<div>', {
                                "class" : "box-pa-list",
                                "data-tipo": item.nome,
                                "data-id_tipo":item.codice,
                                "text":item.nome
                            }).click(function (event) {
                                var option = jQuery(this)[0];
                                var tipo = option.attributes['data-tipo'].value;
                                var id_tipo = option.attributes['data-id_tipo'].value;
                                jQuery('#tipo')[0].value = tipo;
                                jQuery('#id_tipo')[0].value = id_tipo;

                                jQuery("#livesearch").hide();
                            });

                            jQuery("#livesearch").append(textDiv);
                            resultMatch++;
                        }
                    });

                    if(resultMatch == 0){
                        jQuery("#livesearch").html('Nessun risultato');
                        jQuery('#tipo')[0].value = "";
                        jQuery('#id_tipo')[0].value = "";
                    }
                }else{
                    jQuery("#livesearch").html('Nessun risultato');
                }


                jQuery('#livesearch').show();
                if(debug) console.log(arraySup);

            });
        }
    }

    if(jQuery("#id_tipo")[0] && jQuery("#id_tipo")[0].value != ""){
        jQuery.get( "<?php echo $urlAllType;?>", function( data ) {
            var dataParse = JSON.parse(data);
            var arraySup = [];
            resultMatch = 0;
            if(dataParse.length != 0){
                jQuery.each(dataParse, function( i,item ) {
                    if(item.codice == jQuery("#id_tipo")[0].value){//item.nomePA.toLowerCase().indexOf(str.toLowerCase()) != -1 &&

                        jQuery('#tipo')[0].value = item.nome;
                    }
                });

            }

        });
    }



    function showResultPa(str) {
        if (str.length>=3) {
            jQuery("#livesearch2").empty();

            jQuery.get( "<?php echo $urlAllPAClient;?>?nome="+str, function( data ) {
                var dataParse = JSON.parse(data);
                var arraySup = [];
                if(dataParse.length != 0){
                    jQuery.each(dataParse, function( i,item ) {
                        if(maxResultSearch >= i){//item.nomePA.toLowerCase().indexOf(str.toLowerCase()) != -1 &&
                            arraySup.push(item);

                            var textDiv = jQuery('<div>', {
                                "class" : "box-pa-list",
                                "data-id": item.id,
                                "data-title":item.nomePA,
                                "data-cnPA":item.cnPA,
                                "text":item.nomePA
                            }).click(function (event) {
                                var option = jQuery(this)[0];
                                var idPa = option.attributes['data-id'].value;
                                var cnPA = option.attributes['data-cnPA'].value;
                                var title = option.attributes['data-title'].value;
                                jQuery('[name=Ente]')[0].value = title;
                                jQuery('#id_tipo2')[0].value = idPa;
                                jQuery('#cnPA2')[0].value = cnPA;
                            });

                            jQuery("#livesearch2").append(textDiv);
                        }
                    });
                }else{
                    jQuery("#livesearch2").html('<?= JText::_('NO_RESULTS') ?>');
                    if(jQuery("#id_cn_pa_search")[0]) jQuery("#id_cn_pa_search")[0].value = "";
                    if(jQuery("#id_pa_search")[0]) jQuery("#id_pa_search")[0].value = "";

                }


                jQuery('#livesearch2').show();
                if(debug) console.log(arraySup);

            });
        }
    }

    jQuery("#buttonModal").click(function(e){
        e.preventDefault();
        //e.stopPropagation();
        jQuery("#modificaEnte").addClass("in");
        jQuery("#modificaEnte").show();
        jQuery('#main').removeAttr('style');
    });

    jQuery( "#id_pa_search_text" ).click(function() {
        if(jQuery("#id_pa_search_text")[0]) jQuery("#id_pa_search_text")[0].value = "";
        if(jQuery("#id_cn_pa_search")[0]) jQuery("#id_cn_pa_search")[0].value = "";
        if(jQuery("#id_pa_search")[0]) jQuery("#id_pa_search")[0].value = "";
    });

    jQuery( "#id_pa_search_text" ).focusout(function() {
        unfocusResultPA();
        if(jQuery("#id_pa_search")[0] && !jQuery("#id_pa_search")[0].value){
            jQuery("#id_pa_search_text")[0].value = "";
        }

        if(!jQuery("#id_pa_search_text")[0].value){
            if(jQuery("#id_cn_pa_search")[0])jQuery("#id_cn_pa_search")[0].value = "";
            if(jQuery("#id_pa_search")[0])jQuery("#id_pa_search")[0].value = "";
        }
    });

    function unfocusResultPA() {
        setTimeout(function(){
            jQuery("#livesearch").empty();
            jQuery('#livesearch').hide();
        },300);

    }

    jQuery(".content").click(function(e){
        jQuery("#livesearch").hide();
        jQuery("#livesearch2").hide();
    });

    jQuery("#tipo").click(function(e){
        showResult(jQuery('#tipo')[0].value);
    });

    jQuery("#sendButtonSearch").click(function(e){

        if(!jQuery('#id_tipo2')[0].value){

            alert("Errore inserisci tutti i campi o verifica che sia stato inserito un ente esistente");
            e.preventDefault();
        }
    });
    jQuery("#sendButton").click(function(e){

        /*
         * Bug 151
         * Il campo codice IPA permette l'inserimento di qualsiasi tipo di carattere,
         * mentre sono ammessi solo gli alpanumeri e _
         *
         * FIX
         * Controllo sull'input e confronto con l'epressione regolare
         */

        var control = "<?php echo $controlMod;?>";
        if(!validateIPA()){
            alert("<?= JText::_('IPA_VALIDATION_ERROR_MSG')?>");
            e.preventDefault();
        } else if(!jQuery("#ou")[0].value ||!jQuery("#cn")[0].value || !jQuery('#id_tipo')[0].value || (resultMatch == 0 && control == null)){

            alert("Errore inserisci tutti i campi o verifica che sia stato inserito un ente esistente");
            e.preventDefault();
        } else{
//            jQuery('#form-update-ente').hide();
            jQuery('.contentLoading').show();
        }



    });

    /*
     * Bug 151
     * Il campo codice IPA permette l'inserimento di qualsiasi tipo di carattere,
     * mentre sono ammessi solo gli alpanumeri e _
     *
     * FIX
     * Controllo sull'input e confronto con l'epressione regolare
     */
    function validateIPA(){
        var re = /^[a-zA-Z0-9_]*$/;
        var validation = re.test(jQuery('#cn').val());
        return validation;
    }

    jQuery('#cn').keyup(function(e){
        var re = /^[a-zA-Z0-9_]*$/;
        var validation = re.test(jQuery('#cn').val());
        //console.log(validation);
        if(!validation){
            jQuery('#cn-validation-error-msg').show();
        }
        else{
            jQuery('#cn-validation-error-msg').hide();
        }
    });

    jQuery('#tableHistoryCustom').dataTable({
        "language": {
            "sEmptyTable":     "<?= JText::_('EMPTY_TABLE') ?>",
            "sInfo":           "<?= JText::_('DATA_TABLE_S_INFO') ?>",
            "sInfoEmpty":      "<?= JText::_('DATA_TABLE_S_INFO_EMPTY') ?>",
            "sInfoFiltered":   "<?= JText::_('DATA_TABLE_S_INFO_FILTERED') ?>",
            "sInfoPostFix":    "",
            "sInfoThousands":  ".",
            "sLengthMenu":     "<?= JText::_('DATA_TABLE_S_LENGTH_MENU') ?>",
            "sLoadingRecords": "<?= JText::_('LOADING') ?>...",
            "sProcessing":     "<?= JText::_('PROCESSING') ?>...",
            "sSearch":         "<?= JText::_('SEARCH') ?>:",
            "sZeroRecords":    "<?= JText::_('NO_RESULTS') ?>",
            "oPaginate": {
                "sFirst":      "<?= JText::_('FIRST') ?>",
                "sPrevious":   "<?= JText::_('PREVIOUS') ?>",
                "sNext":       "<?= JText::_('NEXT') ?>",
                "sLast":       "<?= JText::_('LAST') ?>"
            },
            "oAria": {
                "sSortAscending":  ": <?= JText::_('SORT_ASC') ?>",
                "sSortDescending": ": <?= JText::_('SORT_DESC') ?>"
            }
        }
    });

</script>

<style>

    #livesearch,#livesearch2{
        display: none;
        z-index: 10;
        background: #f2f2f2;
        max-height: 200px;
        overflow: auto;
        position: absolute;
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc!important;
    }

    #livesearch > div,#livesearch2 > div{
        cursor: pointer;
        padding: 5px 0px;
        font-weight: bold;
    }

    #livesearch > div:hover,#livesearch2 > div:hover{
        text-decoration: underline;
    }

    .btn-user{
        color: #333;
        background-color: #fff;
        border-color: #ccc;
        padding: 5px 10px;
        font-size: 1em;
        line-height: 1.5;
        border-radius: 3px;
    }

    .modal-custom-big{
        width:90%;
    }
	
	#sendButton:hover {
       
	   background-color: #075247;
    }

    .buttonCustomGest{
        margin-top: 20px!important;
        height: 45px;
    }
    .buttonCustomGestLine{
        line-height:25px;
    }
    .buttonCustomGest:hover{
        margin-top: 20px;
        height: 45px;
    }

    .custom-form-group{
        margin-top: 10px;
        height: 35px;
    }

    .validation-error-msg{
        display: none;
        color: red;
    }

    .contentLoading{
        display: none;
        position: absolute;
        top: 0px;
        left: 0px;
        width: 100%;
        height: 100%;
        z-index: 999;
        background: #fff;
        text-align: left;
        line-height: 70px;
    }

</style>