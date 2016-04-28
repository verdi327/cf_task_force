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

		// remove selected from all table tds
		$("table.schedule td").each(function(){
			$(this).removeClass("selected");
		})

		// add selected to the given class type
		$("table.schedule td").each(function(){
			if ( $(this).attr("class") === selectedType ) {
				$(this).addClass("selected");	
			}
		})
	})
});