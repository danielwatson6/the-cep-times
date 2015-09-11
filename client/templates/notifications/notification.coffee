Template.notification.helpers
  message: ->
    n = Notifications.findOne()
    if n then n.message else ''

updateSession = (e) ->
  Session.set('notificationClosed', true)

Template.notification.events
  'click #notification .close': updateSession
  'click #notification .close spam': updateSession
