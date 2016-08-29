$(".pages.get_started").ready(function() {
	$("#footer-signup").hide();

	$("#lead-source-select").multiselect({
		dropUp:true,
		maxHeight:400
	});

	$("#gender-select").multiselect({
		dropUp:true,
		maxHeight:400
	});

});