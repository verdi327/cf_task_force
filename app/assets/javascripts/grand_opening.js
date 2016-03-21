$(".pages.grand_opening").ready(function() {
	$("a.banner").hide();
	$("#phone_number").mask("(999) 999-9999");

	$("form[data-remote]").on("ajax:complete", function(e, data, status, xhr){
		$("#phoneModal").modal("hide");
		alert("All Set! We'll see you April 2nd");
	})
});
