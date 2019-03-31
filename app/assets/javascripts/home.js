$(".pages.home").ready(function() {

  // checking if mobile to switch bg-vid w/ img
  var isMobile = window.matchMedia("only screen and (max-width: 760px)");

  if (isMobile.matches === false) {
    var iframeUrl = "<iframe src='https://www.youtube.com/embed/O1xdkY4QB4Y?controls=0&showinfo=0&rel=0&autoplay=1&loop=1&playlist=O1xdkY4QB4Y' width='640' height='360' frameborder='0' allowfullscreen></iframe>"
    $(".video-foreground").html(iframeUrl);
  }

  if (isMobile.matches) {
    var bgimg = "https://i0.wp.com/cftaskforce.files.wordpress.com/2016/01/black-brick-background-min.jpg";
    $('header').css('background-image', 'url(' + bgimg + ')');  
  }

  // lazy load coach & testimonial videos
  var youtube = document.querySelectorAll( ".youtube" );
  
  for (var i = 0; i < youtube.length; i++) {
    var source = "https://img.youtube.com/vi/"+ youtube[i].dataset.embed +"/sddefault.jpg";
  
    var image = new Image();
    image.src = source;
    image.addEventListener( "load", function() {
        youtube[ i ].appendChild( image );
    }( i ) );

    youtube[i].addEventListener( "click", function() {
        var iframe = document.createElement( "iframe" );

        iframe.setAttribute( "frameborder", "0" );
        iframe.setAttribute( "allowfullscreen", "" );
        iframe.setAttribute( "src", "https://www.youtube.com/embed/"+ this.dataset.embed +"?rel=0&showinfo=0&autoplay=1" );

        this.innerHTML = "";
        this.appendChild( iframe );
    } );
  }

	// Owl Carousel Settings
	$(".about-carousel").owlCarousel({
	    items: 3,
	    navigation: true,
	    pagination: false,
	    navigationText: [
	        "<i class='fa fa-angle-left'></i>",
	        "<i class='fa fa-angle-right'></i>"
	    ],
	});

	$(".portfolio-carousel").owlCarousel({
	    singleItem: true,
	    navigation: true,
	    pagination: false,
	    navigationText: [
	        "<i class='fa fa-angle-left'></i>",
	        "<i class='fa fa-angle-right'></i>"
	    ],
	    autoHeight: true,
	    mouseDrag: false,
	    touchDrag: false,
	    transitionStyle: "fadeUp"
	});

	$(".testimonials-carousel").owlCarousel({
	    singleItem: true,
	    navigation: true,
	    pagination: true,
	    autoHeight: true,
	    navigationText: [
	        "<i class='fa fa-angle-left'></i>",
	        "<i class='fa fa-angle-right'></i>"
	    ],
	    transitionStyle: "backSlide"
	});

	$(".portfolio-gallery").owlCarousel({
	    items: 3,
	});

	// Magnific Popup jQuery Lightbox Gallery Settings
	$('.gallery-link').magnificPopup({
	    type: 'image',
	    gallery: {
	        enabled: true
	    },
	    image: {
	        titleSrc: 'title'
	    }
	});

  // instafeed request
  var feed = new Instafeed({
      get: 'user',
      userId: '2263654386',
      accessToken: '2263654386.1677ed0.354c0759f55245b0b73de3a7d3b5af65',
      resolution: 'low_resolution',
      limit: 21,
      template: '<div class="portfolio identity">' +
                    '<div class="portfolio-wrapper">' +
                      '<img src="{{image}}" alt="">' +
                      '<div class="caption">' +
                        '<div class="caption-text">' +
                          '<a class="text-title" href="{{link}}" target="_blank">{{caption}}</a>' +
                        '</div>' +
                        '<div class="caption-bg"></div>' +
                      '</div>' +
                    '</div>' +
                  '</div>' 
  });
  feed.run();

  // Portfolio Filtering Scripts & Hover Effect
  var filterList = {
      init: function() {
          // MixItUp plugin
          // http://mixitup.io
          $('#instafeed').mixitup({
              targetSelector: '.portfolio',
              filterSelector: '.filter',
              effects: ['fade'],
              easing: 'snap',
              // call the hover effect
              onMixEnd: filterList.hoverEffect()
          });

      },

      hoverEffect: function() {
          // Simple parallax effect
          $('#instafeed .portfolio').hover(
              function() {
                  $(this).find('.caption').stop().animate({
                      bottom: 0
                  }, 200, 'easeOutQuad');
                  $(this).find('img').stop().animate({
                      top: -20
                  }, 300, 'easeOutQuad');
              },
              function() {
                  $(this).find('.caption').stop().animate({
                      bottom: -300
                  }, 200, 'easeInQuad');
                  $(this).find('img').stop().animate({
                      top: 0
                  }, 300, 'easeOutQuad');
              }
          );

      }

  };

  setTimeout(function(){ filterList.init(); }, 1000);
});