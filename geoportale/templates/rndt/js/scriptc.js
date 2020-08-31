jQuery.noConflict();
jQuery(document).ready(function($)
{
    if (jQuery.cookieBar)
    	jQuery.cookieBar
    	({
        message: privacy_message,
        acceptButton: true,
        acceptText: privacy_accept,
        policyButton: true,
        policyText: privacy_policy,
        policyURL: baseurl + privacy_url,
        autoEnable: true,
        acceptOnContinue: false,
        expireDays: 365,
        forceShow: false,
        effect: 'slide',
        element: '#page-wrapper',
        fixed: true,
        domain: privacy_domain,
        referrer: privacy_domain
    	});

    /****************** pulsanti accessibilitÃ  ******************/
    // Set initial values

    // Zoom
    if(!localStorage.getItem("zoom_level"))
        localStorage.setItem("zoom_level", 100);

    var zoom_level      = parseInt(localStorage.getItem("zoom_level"));
    var zoom_level_step = localStorage.getItem("zoom_level_step");
    var zoom_trigger    = zoom_level_step && parseInt(zoom_level_step) > 0 ? $('.zoom_in') : $('.zoom_out');
    var max_zoom_level  = 120; // @author paolo martufi
    var min_zoom_level  = 80;  // @author paolo martufi
    var zoom_step       = 10;  // @author paolo martufi

    // @author paolo martufi
    if(!localStorage.getItem("default_body_font_size"))
        localStorage.setItem("default_body_font_size", $("body").css("font-size"));

    // check su controlZoom
    if(zoom_level != 100 && zoom_level_step)
        window.controlZoom = true;

    // inizializza valore
     if( zoom_level != 100)
        zoom_page("init");

    // Contrast
    if(!localStorage.getItem("contrast")) localStorage.setItem("contrast", 0);

    var contrast = parseInt(localStorage.getItem("contrast"));

    // Click events
    /*
    $('.zoom_in').click(function() {
        zoom_page(10, $(this))
    });
    $('.zoom_out').click(function() {
        zoom_page(-10, $(this)) });
    $('.undo').click(function() {
        zoom_page(0, $(this));
        contrast_page(0, true);
    });
    */

    // @author paolo martufi
    $('.zoom_in').click(function() {
        zoom_page("in");
    });
    $('.zoom_out').click(function() {
        zoom_page("out");
    });
    $('.undo').click(function() {
        zoom_page("reset");
        contrast_page(0, true);
    });

    $('.contrast').click(function() {
        var setItem = "false";
        if(!localStorage.getItem("have_contrast") || localStorage.getItem("have_contrast") == "false")
            setItem = "true";
        localStorage.setItem("have_contrast", setItem);


        contrast_page(1, true)
    });

    //console.log(zoom_level);
    contrast_page(contrast, false);
    //zoom_page(10, $('.zoom_in'));

    // Contrast
    function contrast_page(contrast, changeContrast){
        if(!contrast && !changeContrast)
            return;

        var have_contrast = localStorage.getItem("have_contrast");
        if(have_contrast == "true"){
            contrast = 0;
            changeContrast = true;
        }
        var black = contrast ? 'black' : '';
        var white = contrast ? 'white' : '';
        var bold = contrast  ? 'bold' : '';
        var borderTop = contrast  ? '1px solid white' : '';
        var textDecoration = contrast ? 'underline' : '';

        $('body, #main, .news, .bgreen, .header_social > span, a.accedi, .ui-tabs-anchor, .bgrey, .modal-content, .user-login.bwhite, .content-list-result, .header-list, #filters-box-deatils>li').css("background-color", black);
        $('body, h6, legend, #content h3, .green, .bgrey, .black, a:not(.language_selector), .footer_text>p,.footer_text>span,.footer_text>p>a, .ui-tabs .ui-tabs-panel, .dark_grey, ul.footer_links li a, .ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited, .item-page>div>p>span, ul.list-docs>li>a, .doc, .collapse_btn, ul.breadcrumb>li>a>span, ul.breadcrumb>li>span, ul.breadcrumb>li, .result-in-box-list>p').css("color", white);
        $('.doc, .doc strong a, .vedi-carrello>span, .tematica-detail>li>form>button, .tematica-detail>li>a, ul.user-dropdown>li>a, .filter, #panel-details-filter>div, .lang-inline a').css("color", black);
        $('div.footer_social > a.link_social > span').css("background-color", white);
        $('.category_item p, .white .pull-left').css("font-weight", bold);
        $('.bgreen, .bgrey').css("border-color", white);
        $('ul.footer_links').css("border-top", borderTop);
        $('a>strong, a.green').css("text-decoration", textDecoration);

		$('.menuInspire').css("background-color", black);
		$('.menuInspire').css("border-color", white);
		$('#menuDove.disabled > li a').css("color", black);
		jQuery('#menuDove.disabled > li a')[0].style = "color:"+black+" !important;";
		jQuery('#menuDove.disabled > li a')[1].style = "color:"+black+" !important;";
		jQuery('#menuDove.disabled > li a')[2].style = "color:"+black+" !important;";
		
        if(typeof myPieChart !== 'undefined')
        {
            var color = contrast ? 'white' : '#1c2024';

            myPieChart.options.title.fontColor = color;
            myPieChart.options.legend.labels.fontColor = color;
            myPieChart.update();
        }

        if(changeContrast)
            localStorage.setItem("contrast", contrast);


    }


    /* Bug 169
     * Lo zoom della pagina, non risponde come ci si aspetta dagli standard di accessibilità
     * facendo riferimento a Joompla! FAP, lo zoom modifica solamente la grandezza del testo
     *

     function zoom_page(step, trigger){
     // Zoom just to steps in or out
     if((zoom_level>=120 && step>0 || zoom_level<=80 && step<0) && !window.controlZoom) return;

     // Set / reset zoom
     if(!window.controlZoom){
     if(step==0) zoom_level=100;
     else zoom_level=zoom_level+step;
     }
     window.controlZoom = false;

     var scale = zoom_level / 100;

     // Set page zoom via CSS
     $('#main').css({
     "-moz-transform": "scale(scale, scale)",
     "transform": 'scale('+(scale)+')', // set zoom
     "transformOrigin": '50% 0' // set transform scale base
     });

     // Adjust page to zoom width
     if(zoom_level>100) $('body').css({ width: (zoom_level*1.2)+'%' });
     else $('body').css({ width: '100%' });

     // Activate / deaktivate trigger (use CSS to make them look different)
     if(zoom_level>=120 || zoom_level<=80) trigger.addClass('disabled');
     else trigger.parents('ul').find('.disabled').removeClass('disabled');
     if(zoom_level!=100) $('.undo').removeClass('disabled');
     else $('.undo').addClass('disabled');

     localStorage.setItem("zoom_level", zoom_level);
     localStorage.setItem("zoom_level_step", step);
     }
     */

    /*
     * FIX:
     * Utilizzo jquery per modificare le dimensioni del testo
     */

    /*
     * Font Zoom:
     *
     * utilizza le seguenti variabili globali
     * var zoom_step;
     * var max_zoom_level;
     * var min_zoom_level;
     * var default_body_font_size;
     *
     * @author paolo martufi
     */
    function zoom_page(action){
        zoom_level = parseInt(localStorage.getItem('zoom_level'));
        switch(action)
        {
            case "in":
                if(zoom_level < max_zoom_level)
                    zoom_level += zoom_step ;
                break;
            case "out":
                if(zoom_level > min_zoom_level)
                    zoom_level -= zoom_step;
                break;
            case "reset":
                zoom_level = 100;
                break;
            case "init":
                // lascia lo zoom attualmente impostato se != 100%
                // per calcolare il relativo font-size
                break;
        }

        // Modifico la grandezza del font in base alla percentuale dello zoom
        var default_body_font_size =  localStorage.getItem("default_body_font_size");
        var nu = parseFloat(default_body_font_size, 10);
        var un = default_body_font_size.slice(-2);
        var zoom_font = (nu * zoom_level / 100) + un;
        $("body").css("font-size",zoom_font);
        localStorage.setItem("zoom_level", zoom_level);

        // disable / enable accesibility buttons
        if(zoom_level >= max_zoom_level)
            $('.zoom_in').addClass('disabled');
        else
            $('.zoom_in').removeClass('disabled');

        if(zoom_level <= min_zoom_level)
            $('.zoom_out').addClass('disabled');
        else
            $('.zoom_out').removeClass('disabled');

         if( zoom_level != 100)
             $('.undo').removeClass('disabled');
         else {
             $('.undo').addClass('disabled');
         }
    }

    $(document).keypress(function(event)
    {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if(keycode == '13')	//enter
            $(event.target).click();
    });

    /*********************** outline  **************************/
    document.addEventListener('keydown', function(e) {
        if (e.keyCode === 9) {
            $('body').addClass('show-focus-outlines');
        }
    });
    document.addEventListener('click', function(e) {
        $('body').removeClass('show-focus-outlines');
    });

    /*********************** navbar fixed  **************************/
    var navpos = $('#header').offset();
    jQuery(window).bind('scroll', function() {
        if(jQuery(window).scrollTop() > navpos.top) {
            jQuery('#header').addClass('navbar-fixed-top');
        }else{
            jQuery('#header').removeClass('navbar-fixed-top');
        }
    });
    /*****************************************************************/

    /********************** Cerca *********************/
    if(typeof lang_code!=='undefined' && lang_code=='en')
    {
        $('input#mod-search-searchword').attr('placeholder', search_label+'...');
        $('img.home-search-icon').attr('alt', search_label);
        $('img.home-search-icon').attr('title', search_label);
    }
    /**************************************************/

    /********************** Link guida *********************/
    if(typeof guide_url!=='undefined' && guide_url!='')
    {
        $("a.link_guida").attr("href", baseurl + guide_url);
        $('.link_guida').attr('target','_blank');
        $('.link_guida').attr('title',guida_title);
    }
    else
    {
        $('.link_guida').attr('data-toggle', 'modal');
        $('.link_guida').attr('data-target','#guida');
		$('.link_guida').attr('title',guida_title);
    }
    /***************************************************************/

    /****************** ricerca semplice in home  ******************/
    $('#simple-search').click(function(){
        var searchText  = $.trim($('#searchText').val()).replace(/ /g, '+');
        searchText = searchText ? '?keyword=' + searchText : '';
        //createCookie('datiRicerca', searchText);
        location.href = metadati_url + searchText;
    });

    $('#searchText').keypress(function(event)
    {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if(keycode == '13')	//enter
            $('#simple-search').click();
    });
    /*****************************************************************/

    /**************************** metadati ***************************/
    function CssRotate(deg, obj)
    {
        if(obj.hasClass('rotated'))
        {
            deg = 0;
            obj.removeClass('rotated');
        }
        else
            obj.addClass('rotated');

        $(obj).css(
            {
                transform: "rotate(" + deg + "deg)"
            });
    }

    $('.collapse_btn').click(function()
    {
        //console.log($(this).hasClass('collapsed'));

        CssRotate(45, $(this).find('.plus'));
    })

    /*****************************************************************/

    /************************** cookies *********************************/
    function createCookie(name,value,days) {
        var expires = "";
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days*24*60*60*1000));
            expires = "; expires=" + date.toUTCString();
        }
        document.cookie = name + "=" + value + expires + "; path=/";
    }

    function readCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for(var i=0;i < ca.length;i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1,c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
        }
        return null;
    }
    /****************************************************************/

    /******************** Geoportal language cookie ******************/
    function createGeoportalLangCookie()
    {
        createCookie('geoportalLocale', lang_code);
    }

    createGeoportalLangCookie();

    $('.language_selector').click(function()
    {
        createGeoportalLangCookie();
    })
    /****************************************************************/

    /************************* Accessibility ************************/
    var chartjs_iframe = $('iframe.chartjs-hidden-iframe');
    if(chartjs_iframe.length>0)
        chartjs_iframe.attr('title', 'chart');

    /****************************************************************/
});
