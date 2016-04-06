$(".messages.new").ready(function() { 
	$("#message_created_by").multiselect();
	
	$('#message_recipients').multiselect({
			enableCaseInsensitiveFiltering: true,
			includeSelectAllOption: true,
			maxHeight: 600
		});
})

