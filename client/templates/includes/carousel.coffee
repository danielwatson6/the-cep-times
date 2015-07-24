# Carousel configuration
maximumArticles = 3

Template.carousel.helpers
  articles: ->
    # Exclude update live and add helpers
    Articles.find({category: {$not: 'live'}}, {sort: {submitted: -1}, limit: maximumArticles}).map (article, index) ->
      article.isFirst = 'active' if index is 0
      article.styleOptions = "background-color:" + categories[article.category].color
      article.categoryName = categories[article.category].name
      article

Template.carousel.rendered = ->
  img = $('.carousel-inner .item img')
  width = img.width()
  height = img.height()
  # Make carousel match screen height and crop to not distort
  newHeight = $(window).height() - 60
  newMargin = Math.abs(newHeight - height) / 2 + 38
  img.css('margin-top', -newMargin + 'px')
  img.css('margin-bottom', -newMargin + 'px')
  # Fix caption
  caption = $('.carousel-title')
  caption.css('top', parseInt(caption.css('top')) + 76 + 'px')
