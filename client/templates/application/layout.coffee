Template.layout.helpers
  showNotification: ->
    n = Notifications.findOne()
    # Account for empty DB
    if not n
      return false
    # Check if user has already closed display on session
    local = Session.get('notification')
    if not local or local isnt n.message
      Session.set('notification', n.message)
      Session.set('notificationClosed', false)
    if Session.get('notificationClosed')
      return false
    return n.message isnt ''
