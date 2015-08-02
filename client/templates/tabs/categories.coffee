Template.categories.helpers
  noArticles: ->
    @articles.count() is 0
  backgroundColor: ->
    'background-color:' + categories[@category].color
  categoryName: ->
    categories[@category].name
