# Options for parent template

Template.albumForm.helpers
  formTitle: ->
    if @_id then "Edit Album" else "New Album"

Template.albumForm.events
  'submit form': (e) ->
    e.preventDefault()
    
    album =
      title: $(e.target).find('#title').val()
    
    Meteor.call 'insertAlbum', album, (error, result) ->
      if error then alert error.reason
      console.log result
      Router.go('albumShow', _id: result._id)
