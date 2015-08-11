# Options for both templates specified below

commonArticleHelpers =
  categoryOptions: ->
    categories[@category]
  date: ->
    dateLocal.spanishDate(@submitted)
  hasImage: ->
    !! @carouselImage

commonArticleEvents =
  'click .fa-trash-o': (e) ->
    if Meteor.user() and confirm("Are you sure you want to
      destroy this article? This action is irreversible.")
      Articles.remove(_id: @_id)
      Router.go('articleIndex')

# Options for articleItem template

articleItemHelpers = 
  trimmedContent: ->
    "#{@content.substring(0, 400)}..."

Template.articleItem.helpers(
  _.extend(commonArticleHelpers, articleItemHelpers))

Template.articleItem.events(commonArticleEvents)

# Options for articleShow template

articleShowHelpers =
  backgroundColor: ->
    'background-color:' + categories[@category].color
  categoryName: ->
    categories[@category].name
  processedContent: ->
    paragraphs = @content.split('\n')
    result = ""
    for p in paragraphs
      result += "<p>#{p}</p>" if p isnt ''
    result

Template.articleShow.helpers(
  _.extend(commonArticleHelpers, articleShowHelpers))

Template.articleShow.events(commonArticleEvents)
