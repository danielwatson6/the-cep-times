Template.articleItem.helpers
  categoryOptions: ->
    categories[@category]
  date: ->
    d = @submitted
    "#{d.getDate()} de #{dateLocal.month(d.getMonth())} de #{d.getFullYear()}"
  trimmedContent: ->
    @content.substring(0, 400) + '...'
  
Template.articleShow.helpers
  categoryOptions: ->
    categories[@category]
  date: ->
    d = @submitted
    "#{d.getDate()} de #{dateLocal.month(d.getMonth())} de #{d.getFullYear()}"
  backgroundColor: ->
    'background-color:' + categories[@category].color
  categoryName: ->
    categories[@category].name
  processedContent: ->
    @content.replace(/(?:\r\n|\r|\n)/g, '<br />');
