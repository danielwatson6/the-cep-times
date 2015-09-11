Template.notificationForm.helpers
  message: ->
    n = Notifications.findOne()
    if n then n.message else null

Template.notificationForm.events
  'submit form': (e) ->
    e.preventDefault()
    attributes = message: $(e.target).find('input').val()
    n = Notifications.findOne()
    if n
      Notifications.update(n._id, $set: attributes)
    else
      Notifications.insert(attributes)
    navigate('/')
