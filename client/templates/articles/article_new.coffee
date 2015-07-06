Template.articleNew.helpers
  categories: ->
    l = []
    for category of categories
      c = categories[category]
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
    
    Meteor.call 'insertArticle', article, (error, result) ->
      if error then alert error.reason # TO-DO: add UI for alert
      Router.go('articleShow', _id: result._id)
  
  'change select': (e) ->
    $('#carouselImage').attr('disabled', $('select').val() is 'live')
