Template.categories.helpers
  articles: ->
    Articles.find(category: @category)
  noArticles: ->
    Articles.find(category: @category).count() is 0
  backgroundColor: ->
    'background-color:' + categories[@category].color
  categoryName: ->
    categories[@category].name