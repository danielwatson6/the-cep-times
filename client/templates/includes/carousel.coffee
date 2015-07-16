# Carousel configuration
maximumArticles = 3

Template.carousel.helpers
  articles: ->
    # Exclude update live and add helpers
    Articles.find({category: {$not: 'live'}}, {limit: maximumArticles}).map (article, index) ->
      article.isFirst = 'active' if index is 0
      article.styleOptions = "background-color:" + categories[article.category].color
      article.categoryName = categories[article.category].name
      article

Template.carousel.rendered = ->
  # Make carousel match screen height
  f = height: $(window).height() - 60 + 'px'
  $('.carousel-inner .item img').css(f)
  $('.carousel').css(f)
