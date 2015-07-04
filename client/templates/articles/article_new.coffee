Template.articleNew.helpers
  categories: ->
    l = []
    for category of categories
      c = categories[category]
      # TO-DO: refactor categories.coffee to an array with this value in object
      c.value = category
      if c.isArticleCategory then l.push(c)
    l

Template.articleNew.events
  'submit form': (e) ->
    e.preventDefault()
    
    article =
      title: $(e.target).find('#title').val()
      author: $(e.target).find('#author').val()
      category: $(e.target).find('#category').val()
      carouselImage: $(e.target).find('#carouselImage').val()
      content: $(e.target).find('#content').val()
    
    article._id = Articles.insert(article)
    Router.go('articleShow', article)

# Hack to disable imageURL input when update live is selected
@trackSelect = ->
  $('select').change ->
    $('#carouselImage').attr('disabled', $('select').val() is 'live')
