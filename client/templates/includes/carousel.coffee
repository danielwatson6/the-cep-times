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
  imageURL: -> "background-image: url(#{@carouselImage})"

Template.carousel.rendered = ->
  height = $(window).height() - $('.navbar-static-top').height()
  $('.carousel-inner .image').css('height', height + 'px')
