# Options for albumNew

Template.albumNew.events
  'submit form': (e) ->
    e.preventDefault()
    
    album =
      title: $(e.target).find('#title').val()
    
    Meteor.call 'insertAlbum', album, (error, result) ->
      if error then alert error.reason
      navigate('albumEdit', _id: result._id)

# Options for albumEdit

Template.albumEdit.helpers
  pictures: -> Pictures.find(album_id: @_id)

Template.albumEdit.events 
  'click .add-picture-form': (e) ->
    e.preventDefault()
    UI.render(Template.pictureForm, $('.picture-forms')[0])
  
  'submit form': (e) ->
    e.preventDefault()
    
    attributes =
      title: $(e.target).find('#title').val()
    
    Albums.update @_id, $set: attributes
    
    navigate('albumShow', _id: @_id)
