/*--------------------------------------------------------------------
 *JAVASCRIPT "FakeLoader.js"
 *Version:    1.1.0 - 2014
 *author:     João Pereira
 *website:    http://www.joaopereira.pt
 *Licensed MIT 
-----------------------------------------------------------------------*/
(function ($) {
 
    $.fn.fakeLoader = function(options) {

        //Defaults
        var settings = $.extend({
            timeToHide:1200, // Default Time to hide fakeLoader
            width:'100%', // Default width 
            height:'100%', // Default Height
            zIndex: '999',  // Default zIndex 
            bgColor: '#2ecc71', // Default background color
            spinner:'spinner1', // Default Spinner
            imagePath:'resources/img/Loading5.gif' // Default Path custom image
        }, options);

        //Customized Spinners
        var spinner01 = "<div class='fl spinner1'><img class='loading_img' src='resources/img/Loading5.gif'></div>"; 
        
        //The target
        var el = $(this);

        //Init styles
        var initStyles = {
            'position':settings.pos,
            'width':settings.width,
            'height':settings.height,
            'top':settings.top,
            'left':settings.left
        };

        //Apply styles
        el.css(initStyles);

        //Each 
        el.each(function() {
            var a = settings.spinner;
            //console.log(a)
                switch (a) {
                    
                    case 'spinner1':
                            el.html(spinner01);
                        break;
                    
                    }

                //Add customized loader image

                if (settings.imagePath != 'resources/img/Loading5.gif') {
                    el.html('<div class="fl"><img src="'+settings.imagePath+'"></div>');
                }
                centerLoader();
        });

        //Time to hide fakeLoader
        setTimeout(function(){
            $(el).fadeOut();
        }, settings.timeToHide);

        //Return Styles 
        return this.css({
            'backgroundColor':settings.bgColor,
            'zIndex':settings.zIndex
        });

 
    }; // End Fake Loader
 

        //Center Spinner
        function centerLoader() {

            var winW = $(window).width();
            var winH = $(window).height();

            var spinnerW = $('.fl').outerWidth();
            var spinnerH = $('.fl').outerHeight();

            // 로딩 화면 위치            
            $('.fl').css({
                'position':'relative',
                'width' : '100%',
                'height' : '100%',
                'left':'20%',
                'top':'7%'
            });

        }

        $(window).on('load', function(){
                centerLoader();
              $(window).resize(function(){
                centerLoader();
              });
        });
}(jQuery));
