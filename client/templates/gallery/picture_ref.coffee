Template.pictureRef.events
  'click .fa-gear': (e) ->
    p = $(e.target).parent()
    UI.renderWithData(Template.pictureForm, @, p.parent()[0])
    p.remove()
