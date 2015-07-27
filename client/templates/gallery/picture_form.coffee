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
      data = Pictures.findOne(@_id)
    else
      picture =
        url: url
        album_id: Router.current().params._id
      _id = Pictures.insert(picture)
      data = Pictures.findOne(_id)
    UI.renderWithData(Template.pictureRef, data, $('.picture-forms')[0])
    form.remove()
  
  'click .remove-picture': (e) ->
    form = findForm(e)
    if @_id and Meteor.user() and confirm("Delete this picture?")
      Pictures.remove(_id: @_id)
    form.remove()
