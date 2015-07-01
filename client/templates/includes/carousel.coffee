# Carousel configuration
maximumArticles = 3

Template.carousel.helpers
  articles: ->
    # TO-DO: implement method into collection
    Articles.find({}, {limit: maximumArticles}).map (article, index) ->
      article.isFirst = 'active' if index is 0
      article.styleOptions = "background-color:" + categories[article.category].color
      article
