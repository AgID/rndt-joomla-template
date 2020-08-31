<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

require_once JPATH_BASE . '/includes/functions.php';


$pathIframe = "/catalog/publication/uploadMetadata.page";

$urlComplete = GPT_BASE_URL.$pathIframe;
?>

<div class="container top30 bottom50">
    <div class="row">
        <div class="col-md-12">
            <h2 class="subtitle_custom"><?= JHtml::_('content.prepare', '{loadmodule breadcrumbs}') ?></h2>
			<iframe class="iframe_geoportal" scrolling="no" src="<?php echo $urlComplete;?>" title="<?= $this->escape($this->item->title) ?>"></iframe>
		</div>
	</div>
</div>

<script language="javascript" type="text/javascript">

jQuery(document).ready(function(){
	
	function receiveMessage(event){
	  // Do we trust the sender of this message?  (might be
	  // different from what we originally opened, for example).
	  if (event.origin !== "<?php echo $urlComplete;?>") 
		  jQuery(".iframe_geoportal").height(event.data);
	  // event.source is popup
	  // event.data is "hi there yourself!  the secret response is: rheeeeet!"
	}
	window.addEventListener("message", receiveMessage, false);
	
});
</script>