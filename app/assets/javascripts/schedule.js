$(".pages.schedule").ready(function() {
	$('#collapseOne').collapse("hide");
	
	$(".class-options button").on("click", function(){
		// remove selected class from all buttons
		$(".class-options button").each(function(){
			$(this).removeClass("selected");
		})

		// add selected class to button just clicked
		$(this).addClass("selected");
		var selectedType = $(this).data("type");
		$("table.schedule td").each(function(){
			$(this).removeClass("selected");
		})

		$("table.schedule td").each(function(){
			if ( $(this).attr("class") === selectedType ) {
				$(this).addClass("selected");	
			}
		})
	})
});