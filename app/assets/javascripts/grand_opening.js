$(".pages.grand_opening").ready(function() {
	$(".vendor-carousel").owlCarousel({
	    items: 5,
	    navigation: true,
	    pagination: false,
	    navigationText: [
	        "<i class='fa fa-angle-left'></i>",
	        "<i class='fa fa-angle-right'></i>"
	    ],
	});
});
