Template.articleItem.helpers
  categoryOptions: -> categories[@category]
  # TO-DO: decide how to trim content
  trimmedContent: -> @content
  
Template.articleShow.helpers
  categoryOptions: -> categories[@category]
