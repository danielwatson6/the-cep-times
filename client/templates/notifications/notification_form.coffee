Template.notificationForm.events
  'submit form': (e) ->
    e.preventDefault()
    attributes =
      message: $(e.target).find('#message').val()
      icon: $(e.target).find('#icon').val()
    n = Notifications.findOne()
    if n
      Notifications.update(n._id, $set: attributes)
    else
      Notifications.insert(attributes)
    navigate('/')
