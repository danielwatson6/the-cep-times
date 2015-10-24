Template.articleSearch.helpers
  showLogo: -> $(window).width() < 1000
  noArticles: ->
    @articles.count() is 0
