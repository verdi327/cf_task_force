$(".wendlers.index").ready(function() { 

	// $(document).on('click', ".btn", {} ,function(){
	//   var week = $(this).data("week");
	//   $("#week").val(week);
	//   $("#wendler-form").submit();
	// })

	$(".weeks .btn").on("click", function(){
		var week = $(this).data("week");
		$("#week").val(week);
		$("#wendler-form").submit();
	})
	
})