# Options for parent template

Template.albumForm.helpers
  formTitle: ->
    if @_id then "Edit Album" else "New Album"
