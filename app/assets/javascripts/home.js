$(".pages.home").ready(function() {
  // instafeed request
  var instagramClientId = $("#insta-id").data("id")
  var feed = new Instafeed({
      get: 'user',
      userId: '173751168',
      clientId: instagramClientId,
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
});