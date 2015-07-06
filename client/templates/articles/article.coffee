Template.articleItem.helpers
  categoryOptions: ->
    categories[@category]
  date: ->
    dateLocal.spanishDate(@submitted)
  trimmedContent: ->
    "#{@content.substring(0, 400)}..."
  
Template.articleShow.helpers
  categoryOptions: ->
    categories[@category]
  date: ->
    dateLocal.spanishDate(@submitted)
  backgroundColor: ->
    'background-color: #{categories[@category].color}'
  categoryName: ->
    categories[@category].name
  processedContent: ->
    @content.replace(/(?:\r\n|\r|\n)/g, '<br />')
