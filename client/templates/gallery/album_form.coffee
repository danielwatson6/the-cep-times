# Options for parent template

# Options for albumNew

Template.albumNew.events
  'submit form': (e) ->
    e.preventDefault()
    
    album =
      title: $(e.target).find('#title').val()
    
    Meteor.call 'insertAlbum', album, (error, result) ->
      if error then alert error.reason
      Router.go('albumEdit', _id: result._id)

# Options for albumEdit

Template.albumForm.helpers 
