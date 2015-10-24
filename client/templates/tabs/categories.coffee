Template.categories.helpers
  showLogo: -> $(window).width() < 1000
  noArticles: ->
    @articles.count() is 0
  backgroundColor: ->
    'background-color:' + categories[@category].color
  categoryName: ->
    categories[@category].name
