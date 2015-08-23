findForm = (e) ->
  t = $(e.target)
  # Fix error when user clicks exactly on icon
  if t.hasClass('fa') then t = t.parent()
  t.parent()

Template.pictureForm.events
  'click .save-picture': (e) ->
    form = findForm(e)
    url = form.find('input').val()
    if @_id
      Pictures.update @_id, $set: {url: url}
    else
      picture =
        url: url
        album_id: Router.current().params._id
      
      Meteor.call 'insertPicture', picture, (error, result) ->
        if error then alert error.reason
    
    form.remove()
  
  'click .remove-picture': (e) ->
    form = findForm(e)
    if @_id and Meteor.user() and confirm("Delete this picture?")
      Pictures.remove(_id: @_id)
    form.remove()
