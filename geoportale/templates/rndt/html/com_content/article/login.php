<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

require_once JPATH_BASE . '/includes/functions.php';

$pathIframe = "/catalog/identity/login.page";

$urlComplete = GPT_BASE_URL.$pathIframe;

?>
<div class="container-fluid">
    <iframe class="iframe_geoportal" src="<?php echo $urlComplete;?>" onload='javascript:resizeIframe(this);' title="<?= $this->escape($this->item->title) ?>"></iframe>
</div>


<script language="javascript" type="text/javascript">
    function resizeIframe(obj) {
        //obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
    }
    function returnLogin(json) {
        alert("ciao");
        console.log(json);
    }

    // Create IE + others compatible event handler
    var eventMethod = window.addEventListener ? "addEventListener" : "attachEvent";
    var eventer = window[eventMethod];
    var messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message";

    // Listen to message from child window
    eventer(messageEvent,function(e) {
        alert("ciao");
        console.log('parent received message!:  ',e.data);
    },false);
</script>