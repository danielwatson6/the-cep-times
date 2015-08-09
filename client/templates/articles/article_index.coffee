Template.articleIndex.helpers
  showCarousel: -> @articles.count() isnt 0
  showLogo: -> $(window).width() < 1000
