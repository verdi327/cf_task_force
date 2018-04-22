$(".pages.six_week_crossfit_challenge").ready(function() {
  $( "#completed-booking").on( "click", function() {
  	fbq('track', "Lead");
  	console.log("you're now a lead in FB");
  	$("#schedule-form-modal").modal("hide");
  	window.location = "http://cigarcitycrossfit.com/thank-you";
	});
});