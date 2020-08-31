<?php

defined('JPATH_BASE') or die;
$app    = JFactory::getApplication();
$baseurls   = JURI::base().'templates/'.$app->getTemplate().'/';

?>

<div id="modalCart" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn bgrey" onclick="clearCart();"><?= JText::_('CART_EMTPY') ?></button>
                <button type="button" class="btn bgrey" data-dismiss="modal"><?= JText::_('CART_CLOSE') ?></button>
                <button type="button" class="btn bgreen pull-right" onclick="send_cart();"><?= JText::_('CART_EXECUTE') ?>(<span id="nCartElement_2">0</span>)</button>
            </div>
            <div class="modal-body">
                <ul id="listElementCart"></ul>
            </div>
        </div>

    </div>
</div>
<iframe id="iframe_content" style="display: none;" title=""></iframe>

<script type="text/javascript">

    var objImp = JSON.parse(getCookie());
    var pathComplete_cart ="<?php echo GPT_BASE_URL;?>";

    function controlCheckBox(index,checkbox,name){
        var idElement = checkbox.attributes['id-element-cart'].value;
        if(!checkbox.checked){
            removeElement_cart(index,idElement);
        }else{
            addElement_cart(index,idElement,name);
        }
    }

    function nCartElementSetting(){
        if(objImp){
            var number = objImp.length;
            jQuery("#nCartElement_1").html(number);
            jQuery("#nCartElement_2").html(number);
        }

    }
    function setList(){
        if(objImp){
            var list = jQuery("#listElementCart");

            for(var i = 0; i<objImp.length;i++){
                list.append('<li id-element-cart="'+objImp[i].idMeta+'">' +
                    '<span onclick="removeElement_cart('+objImp[i].id+',\''+objImp[i].idMeta+'\');">X</span> <span class="listElement">'+objImp[i].name+'</span>' +
                    '</li>');
            }
        }

    }

    function removeElement_cart(index,idMeta){
        var specialistPath = "/cart/remove?key="+encodeURI(idMeta);

        var arraySup = [];

        for(var i=0; i<objImp.length;i++){
            if(objImp[i].id!=index){
                arraySup.push(objImp[i]);
            }else{
                paramsSet(objImp[i].id,objImp[i].idMeta,objImp[i].name)
            }
        }

        objImp = arraySup;

        paramsSet(index,idMeta,0);
        callService(specialistPath,3,true);
    }

    function addElement_cart(index,idMeta,name){
        var specialistPath = "/cart/add?key="+encodeURI(idMeta);
        paramsSet(index,idMeta,name);
        callService(specialistPath,2,true);

    }

    function send_cart(){
        var list = jQuery('#listElementCart li');

        var listID = "";
        for(var i=0; i<list.length;i++){
                
            if(i!=0) listID += ",";
            listID += list[i].attributes['id-element-cart'].value;
            
        }
		
        if(list.length != 0){
			var specialistPath = "/cart/process?keys="+encodeURI(listID);
			callService(specialistPath,4,true);
		}
        
    }

    function clearCart(){
        jQuery("#listElementCart").html("");
        var specialistPath = "/cart/clear";
        callService(specialistPath,0,true);

    }

    function setCheckedCheckbox() {

        var arrayCheckbox = jQuery( ":checkbox" );

        for(var i=0;i< arrayCheckbox.length;i++){
            arrayCheckbox[i].checked = false;
        }

        for(var i=0;i< arrayCheckbox.length;i++){
            var item = arrayCheckbox[i].attributes['id-element-cart'].value;
            if(item){
                for(var j=0;j< objImp.length;j++){
                    if(item == objImp[j].idMeta){
                        arrayCheckbox[i].checked = true;
                    }
                }
            }
        }
    }

    function initCart(){
        jQuery(document).ready(function(){
            setCheckedCheckbox();
            jQuery("#listElementCart").html("");
            var specialistPath = "/cart/keys";
            callService(specialistPath,1,true);
        });
    }

    var index,idMeta,name;
    function paramsSet(index1,idMeta1,name1) {
        index = index1;
        idMeta = idMeta1;
        name = name1;
    }

    function callService(url,response,nCartElementControl){
        url = pathComplete_cart+url;
        //var urlProxy = "<?php echo $baseurls;?>/html/layouts/joomla/content/cart/serviceCart/serviceCart.php?url="+url;

        var iframe = jQuery('#iframe_content');
        if ( iframe.length && response == 4) {
            iframe.attr('src',url);
          
        }
		
		responseRequest(response,nCartElementControl,true);
    }

    function ajaxService(url,response,nCartElementControl) {
        jQuery.ajax({
            url: urlProxy,
            crossDomain: true,
            success: function(result){
                responseRequest(response,nCartElementControl,result);
            }}
        );
    }

    function responseRequest(response,nCartElementControl,result) {
        if(result){

            if(response==0){objImp = [];}
            if(response==1){setList();}

            if(response==2){
                objImp.push({"id":index,"idMeta":idMeta,"name":name});

                var list = jQuery("#listElementCart");
                list.append('<li id-element-cart="'+idMeta+'">' +
                    '<span onclick="removeElement_cart('+index+',\''+idMeta+'\');" tabindex="0">X</span> <span class="listElement">'+name+'</span>' +
                '</li>');
				/*list.append('<li id-element-cart="'+idMeta+'">' +
                    '<span onclick="removeElement_cart('+index+',\''+idMeta+'\');" tabindex="0">X</span> <span class="listElement">'+name+'</span>' +
                '</li>');*/
				
            }

            if(response==3){
                var list = jQuery('#listElementCart li');

				var search = null;
                for(var i=0; i<list.length;i++){

                    if(list[i].attributes['id-element-cart'].value == idMeta){
						search = i;
                       
                        break;
                    }
                }
				if(search != null) 
					if(search == 0)
						jQuery('#listElementCart li:first-child').remove();
					else
						jQuery('#listElementCart li:nth-child('+search+')').remove();
            }

            saveElement();
            setCheckedCheckbox();
            if(nCartElementControl) {
                nCartElementSetting();
            }

        }
    }

    function saveElement() {
        var d = new Date();
        d.setTime(d.getTime() + (60*60*1000));
        var expires = "expires="+ d.toUTCString();
        document.cookie = "saveObject=" + JSON.stringify(objImp) + ";" + expires + ";path=/";
    }

    function getCookie() {
        var name = "saveObject=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split(';');
        for(var i = 0; i <ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "[]";
    }


    initCart();

    jQuery('#modalCart').bind('DOMSubtreeModified', function(e) {
        setTimeout(function () {
            if(jQuery( "#modalCart" ).hasClass( "collapse" )){
                jQuery( "#modalCart" ).removeClass( "collapse" );
                jQuery( "#modalCart" ).addClass( "in" );
                jQuery("#modalCart").height("auto");
            }
        },500);

    });
</script>

<style>
    #modalCart{
    }

    #modalCart .modal-content {
        border-radius: 0;
    }

    #modalCart .btn{
        width: 160px;
    }

    #modalCart .btn span{
        display: inline;
    }

    #listElementCart{
        list-style: none;
    }

    #listElementCart li{
        padding: 20px 15px;
        border-bottom: 1px solid #e5e5e5;
    }

    #listElementCart li span{
        font-weight: bold;
        font-size: 0.85em;
        letter-spacing: 1px;
    }

    #listElementCart li span:first-child{
        font-size: 0.85em;
        /* font-weight: normal; */
        color: red;
        padding-right: 5px;
        cursor: pointer;
    }
</style>