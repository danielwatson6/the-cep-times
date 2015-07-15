# Options for parent template

Template.articleForm.helpers
  categories: ->
    l = []
    for category of categories
      c = categories[category]
      c.value = category
      if c.isArticleCategory then l.push(c)
    l

Template.articleForm.events
  'change select': (e) ->
    $('#carouselImage').attr('disabled', $('select').val() is 'live')

# Method to extract data from form

getArticleAttributes = (e) ->
  title: $(e.target).find('#title').val()
  author: $(e.target).find('#author').val()
  category: $(e.target).find('#category').val()
  carouselImage: $(e.target).find('#carouselImage').val()
  content: $(e.target).find('#content').val()

# Individual submit actions

Template.articleNew.events
  'submit form': (e) ->
    e.preventDefault()
    article = getArticleAttributes(e)
    
    Meteor.call 'insertArticle', article, (error, result) ->
      if error then alert error.reason # TO-DO: add UI for alert
      Router.go('articleShow', _id: result._id)

Template.articleEdit.events
  'submit form': (e) ->
    e.preventDefault()
    article = getArticleAttributes(e)

