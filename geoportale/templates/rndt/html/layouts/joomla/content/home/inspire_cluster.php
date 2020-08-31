<?php

defined('JPATH_BASE') or die;

$app    = JFactory::getApplication();
$baseurls   = JURI::base(true).'/templates/'.$app->getTemplate().'/';

$lang = JFactory::getLanguage();
$lang_code = substr($lang->getTag(), 0,2);


function getThemeDocumentsNumber($theme,$getThemeDocumentsNumberRecord){
    if(!empty($getThemeDocumentsNumberRecord)){
        foreach($getThemeDocumentsNumberRecord as $element){
            if($element['name'] == $theme)
                return $element['documents'];
        }
    }
    return 0;
}

function getThemes($displayData,$baseurls,$lang_code){

    $themeItems = '';
    $clusterDocsNum = array();

    //if(empty($_SESSION['getThemeDocumentsNumberRecord'])){
    $html = file_get_contents(GPT_THEMES_URL);
    $json = json_decode(utf8_encode($html),true);
    $getThemeDocumentsNumberRecord = $json['terms'];
    $_SESSION['getThemeDocumentsNumberRecord'] = $getThemeDocumentsNumberRecord;
    //}

    //$getThemeDocumentsNumberRecord = $_SESSION['getThemeDocumentsNumberRecord'];


    foreach($displayData['thematicClusters'] as $key => $cluster){
        $themeItem = '';
        $clusterDocsNum[$cluster['name']] = 0;

        foreach($cluster['children'] as $k => $theme){
            $themeName  = $displayData['inspireThemes'][$theme.'-'.$lang_code];
            $themeNameEN= $displayData['inspireThemes'][$theme.'-it'];
            $themeURL = JText::_('URL_METADATA'). '?keyword=INSPIRETheme:"'.$themeNameEN.'"';

            $documentsNum = getThemeDocumentsNumber($themeNameEN,$getThemeDocumentsNumberRecord);
            $clusterDocsNum[$cluster['name']] += $documentsNum;

            if(strlen($themeName)>33){
                $themeName = substr($themeName, 0, 33).'...';
            }

            $baseUrl = JUri::base().$themeURL;
            $themeItem .=
                "<div class='col-md-3 text-center'>
					<div class='theme_item'>
						<div class='theme_inner_item'>
							<a href='$baseUrl'>
								<img src='{$baseurls}images/inspire/temi/$theme.png' class='theme_image' alt='".htmlspecialchars($themeName)."'>
								<h5 class='dark_grey top20 theme_name' tabindex='1'>$themeName <span class='nobreak'>($documentsNum)</span></h5>
							</a>
						</div>
					</div>
				</div>";
        }

        $themeItems .=
            "<div class='collapse' id='{$cluster['name']}'>
		
				<div class='triangle text-center'></div>
				<div class=''>
					<h2>{$cluster[$lang_code]}</h2>
					<div class='title-underline top20'><div></div></div>
					<div class='row top20'>$themeItem</div>
				</div>
			</div>";
    }

    return
        [
            'themeItems'	=>	$themeItems,
            'clusterDocsNum'=>	$clusterDocsNum
        ];
}

?>


    <div class="container-fluid top20">
        <div id="tab_cluster">
			<div class="container">
				<div class="ROW">
					<div class="col-md-12">
						<h1 class="bold"><?= JText::_('INSPIRE_CLUSTERS_TITLE') ?></h1>
						<div class="title-underline top20"></div>
					</div>
				</div>
			</div>
            <div class="container">
                <ul>
                    <?php if(!empty($displayData['thematicClusters'])):?>
                        <li><a href='#tabs_cluster-1' class="aTabCluster"><?= JText::_('INSPIRE_CLUSTERS') ?></a></li>
                    <?php endif;?>
                    <?php if(!empty($displayData['priorityDataset'])):?>
                        <li><a href='#tabs_cluster-2' class="aTabCluster"><?= JText::_('PDATASET') ?></a></li>
                    <?php endif;?>
                    <?php if(!empty($displayData['openData'])):?>
                        <li><a href='#tabs_cluster-3' class="aTabCluster"><?= JText::_('OPENDATA') ?></a></li>
                    <?php endif;?>
                </ul>
            </div>
            <?php
            if(!empty($displayData['thematicClusters'])):
                $themes = getThemes($displayData,$baseurls,$lang_code);
                $themeItems		= $themes['themeItems'];
                $clusterDocsNum = $themes['clusterDocsNum'];
            ?>
            <div class="content-cluster" id="tabs_cluster-1">
                <div class="large-12 columns containerSlider">
                    <div id="categoryInspire" class="owl-carousel owl-theme">
                        <?php foreach($displayData['thematicClusters'] as $key => $cluster):?>
                            <div class="item category_item" data-toggle="collapse" data-parent="collapseGroup" data-target="#<?=$cluster['name'];?>" aria-expanded="false" aria-controls="<?=$cluster['name'];?>">
                                <div class="overBackground"></div>
                                <img class="category_img" src="<?= $baseurls ?>images/inspire/categorie/<?=$cluster['name'];?>.png" alt="<?= htmlspecialchars($cluster[$lang_code]) ?>">
                                <p class="text-center full-width" tabindex="0"><?= $cluster[$lang_code];?> (<?= $clusterDocsNum[$cluster['name']] ?>)</p>
                            </div>
                        <?php endforeach; ?>
                    </div>

                    <div id="collapseGroup" class="container top50 bottom50">
                        <?= $themeItems ?>
                    </div>
                </div>
            </div>
            <?php endif; ?>

            <?php if(!empty($displayData['priorityDataset'])):?>
            <div class="content-cluster" id="tabs_cluster-2">
                <div class="large-12 columns containerSlider">
                    <div id="categoryPriorityDataset" class="owl-carousel owl-theme">
                        <?php
                        foreach($displayData['priorityDataset'] as $key => $cluster)
                        {
                            ?>
                            <div class="item category_item" data-toggle="collapse" data-parent="collapseGroup" data-keywords='<?=json_encode($cluster['keywords']);?>' data-target="#<?=$cluster['name'];?>" aria-expanded="false" aria-controls="<?=$cluster['name'];?>">
                                <div class="overBackground"></div>
                                <img class="category_img" src="<?= $baseurls ?>images/inspire/categorie/<?=$cluster['name'];?>.png" alt="<?= htmlspecialchars($cluster[$lang_code]) ?>">
                                <p class="text-center full-width" tabindex="0"><?= $cluster[$lang_code];?></p>
                            </div>
                            <?php
                        }
                        ?>
                    </div>
                </div>
            </div>
            <?php endif; ?>
			
			<?php if(!empty($displayData['openData'])):?>
            <div class="content-cluster" id="tabs_cluster-3">
                <div class="large-12 columns containerSlider">
                    <div id="categoryOpenData" class="owl-carousel owl-theme">
                        <?php
                        foreach($displayData['openData'] as $key => $cluster)
                        {
                            ?>
                            <div class="item category_item" data-toggle="collapse" data-parent="collapseGroup" data-keywords='<?=json_encode($cluster['keywords']);?>' data-target="#<?=$cluster['name'];?>" aria-expanded="false" aria-controls="<?=$cluster['name'];?>">
                                <div class="overBackground"></div>
                                <img class="category_img" src="<?= $baseurls ?>images/inspire/categorie/<?=$cluster['name'];?>.png" alt="<?= htmlspecialchars($cluster[$lang_code]) ?>">
                                <p class="text-center full-width" tabindex="0"><?= $cluster[$lang_code];?></p>
                            </div>
                            <?php
                        }
                        ?>
                    </div>
                </div>
            </div>
            <?php endif; ?>
        </div>

    </div>

    <script>
        setTimeout(function(){jQuery("#tab_cluster").tabs();},100);

        jQuery.noConflict();
        $ = jQuery;
        jQuery(document).ready(function($) {

            if ($("#categoryInspire")) {
                $("#categoryInspire").owlCarousel({
                    center: true,
                    loop: true,
                    lazyLoad: true,
                    items: 5,
                    responsiveClass: true,
                    nav: true,
                    touchDrag: false,
                    mouseDrag: false,
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 3
                        },
                        1000: {
                            items: 5
                        }
                    }
                });

                $('#categoryInspire').on('click', '.item', function() {
                    var index = $(".item").index(this);
                    if(index!= -1){

                        var active = $("#categoryInspire .owl-stage .active").length;
                        var numb = 0;
                        if(active == 5){
                            numb = 4;
                        }else if(active == 3){
                            numb = 4;
                        }

                        var numbers = parseInt(parseInt(index)+parseInt(numb));

                        if(active > 1) {
                            $("#categoryInspire").trigger("to.owl.carousel", [numbers, 1, true]);
                        }
                    }
                });

            }
			
			
            window.pathFolder = "<?php echo $baseurls;?>advancedSearch/";
			window.gptUrl = "<?php echo GPT_REST_URL_SERVER;?>";
			
			function generateDefineUrl(urlGeoportal,params) {

                var count = 1;
                for(var item in params){
                    urlGeoportal += count++ <= 1 ? "?" : "&";
                    urlGeoportal += item + "=" + params[item];
                }
                return urlGeoportal;
            }
			
			function createObjUrl(str) {

                var urlGeoportal = window.pathFolder + "/services-advancedSearch.php";


                var params = {
                    start: 1,
                    max: 15,
                    geometryType: "esriGeometryBox",
                };

                var cookie = generateDefineUrl("", params) + "&f=json";
                var paramsCrip = generateDefineUrl(window.gptUrl, params) + "&searchText=" + str;

                //if (debug) console.log(generateDefineUrl(window.gptUrl, params) + adapt + "&f=pjson");
                var proxy = true;

                if (proxy) {
                    var str = {
                        GPT_REST_URL_SERVER: encodeURIComponent(paramsCrip),
                        url: window.gptUrl
                    };
                    obj = {
                        type: "POST",
                        url: urlGeoportal,
                        data: str
                    };
                } else {
                    obj = {
                        type: "GET",
                        url: paramsCrip
                    };
                }

                //var jsonObj = JSON.stringify(obj);
                var d = new Date();
                d.setTime(d.getTime() + (1 * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                //document.cookie =  "datiRicerca=" + jsonObj + ";" + expires + ";path=/";
                document.cookie = "datiRicerca=" + cookie.substring(1) + ";" + expires + ";path=/";
                document.cookie = "datiRicercaUrl=" + paramsCrip + ";" + expires + ";path=/";

                window.location = "<?= JURI::root() . JText::_('URL_METADATA') ?>";

            }

            if ($("#categoryPriorityDataset")) {
                $("#categoryPriorityDataset").owlCarousel({
                    
                    loop: true,
                    lazyLoad: true,
                    items: 7,
                    responsiveClass: true,
                    nav: true,
                    touchDrag: false,
                    mouseDrag: false,
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 3
                        },
                        1100: {
                            items: 6
                        }
                    }
                });

                $('#categoryPriorityDataset').on('click', '.item', function() {
                    
					var attr = this.getAttribute("data-keywords");
					if(attr){
						var data = JSON.parse(this.getAttribute("data-keywords"));
						
						/*var strKeywords = '';
						for(var i=0;i<data.length;i++){
							strKeywords +='"'+data[i].trim()+'"';
							if(i<data.length-1)strKeywords +=' OR ';
						}
						var keywords = {'keywords':'keywords:('+strKeywords+')'};*/
						var keywords = {'PriorityDataset':'PriorityDataset:("'+data.join('" OR "')+'")'};
						document.cookie =  "saveObjSearchText=" + JSON.stringify(keywords) + ";" + (24*60*60) + ";path=/";
						document.cookie =  "saveCompositeStr=" + JSON.stringify({"spatialRel":"spatialRel=all"}) + ";" + (24*60*60) + ";path=/";
						document.cookie =  "refer_url=ricercaDettagliata;" + (24*60*60) + ";path=/";
						createObjUrl('keywords:("'+data.join(" OR ")+'")');
					}
					
                });
			
            }
			
			if ($("#categoryOpenData")) {
                $("#categoryOpenData").owlCarousel({
                    loop: true,
                    lazyLoad: true,
                    items: 7,
                    responsiveClass: true,
                    nav: true,
                    touchDrag: false,
                    mouseDrag: false,
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 3
                        },
                        1100: {
                            items: 6
                        },
                        1300: {
                            items: 9
                        }
                    }
                });

				$('#categoryOpenData').on('click', '.item', function() {
                    var attr = this.getAttribute("data-keywords");
					if(attr){
						var data = JSON.parse(this.getAttribute("data-keywords"));
						/*var strKeywords = '';
						for(var i=0;i<data.length;i++){
							strKeywords +='"'+data[i].trim()+'"';
							if(i<data.length-1)strKeywords +=' OR ';
						}
						var keywords = {'keywords':'keywords:('+strKeywords+')'};*/
						var keywords = {'OpenDataTheme':'OpenDataTheme:("'+data.join('" OR "')+'")','OpenData':'OpenData:(true)'};
					
						document.cookie =  "saveObjSearchText=" + JSON.stringify(keywords) + ";" + (24*60*60) + ";path=/";
						document.cookie =  "saveCompositeStr=" + JSON.stringify({"spatialRel":"spatialRel=all"}) + ";" + (24*60*60) + ";path=/";
						document.cookie =  "refer_url=ricercaDettagliata;" + (24*60*60) + ";path=/";
						//window.location="<?= BASE_URL_PROTO . JText::_('URL_METADATA') ?>";
						createObjUrl('keywords:("'+data.join(" OR ")+'")');
					}
                });
            }
        });

        $(document).click(function(e)
        {
            var className = e.target.className;

            if (className.indexOf('theme_name') == -1 && className.indexOf('theme_image') == -1)
                jQuery('.in').collapse('hide');
        });
    </script>




<style>
    #categoryInspire{

    }
    .owl-carousel .owl-nav .owl-prev,
    .owl-carousel .owl-nav .owl-next,
    .owl-carousel .owl-nav .owl-prev:hover,
    .owl-carousel .owl-nav .owl-next:hover{
        position: absolute;
        background-repeat: no-repeat;
        background-color: #fff;
        background-position: 8px;

        color: transparent;
        padding: 4px;
        margin: 0;
        border-radius: 0;
        top: 110px;
        height: 40px;
    }


    .owl-carousel .owl-nav .owl-prev,.owl-carousel .owl-nav .owl-prev:hover{
        left: 0;
        background-image: url(<?php echo JUri::base();?>/templates/rndt/images/icons/Back.png);
    }
    .owl-carousel .owl-nav .owl-next,.owl-carousel .owl-nav .owl-next:hover{
        right:0;
        background-image: url(<?php echo JUri::base();?>/templates/rndt/images/icons/Next.png);
    }
    .owl-theme .owl-nav {
        margin-top: 0;
    }

    .owl-theme .owl-dots{
        display: none;
    }

    .triangle{
        top: -80px!important;
    }


    #tab_cluster{
        border:none;
    }

    .containerSlider{
        margin: 0 -55px;
    }

    .aTabCluster{
        font-size: 25px;
    }
	
	 
 #categoryPriorityDataset,#categoryOpenData, #categoryPriorityDataset .category_img,#categoryOpenData .category_img, #categoryPriorityDataset .category_item,#categoryOpenData .category_item{
  height:200px; 
  background: #f6f6f6;
  width: auto!important;
    display: block;
    margin: auto;
	min-height: 200px;
    min-width: 200px;
}
#categoryPriorityDataset .owl-prev,#categoryPriorityDataset .owl-next, #categoryOpenData .owl-prev,#categoryOpenData .owl-next{
	top:40%;
}

#categoryPriorityDataset .category_img, #categoryOpenData .category_img{
	opacity:1!important;
}
#categoryPriorityDataset .category_img{
	padding:40px;
}

#categoryPriorityDataset .overBackground, #categoryOpenData .overBackground{
	background:transparent;
}

</style>
