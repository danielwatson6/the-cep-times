Template.notification.helpers
  message: ->
    n = Notifications.findOne()
    if n then n.message else ''
  icon: ->
    n = Notifications.findOne()
    if n and n.icon then 'fa-' + n.icon else ''

updateSession = (e) ->
  Session.set('notificationClosed', true)
  # Hack to fix sidebar after closing notification popup
  # Bootstrap's given method is not updating object and there are no getters
  originalOffset = $('.sidebar').data('bs.affix').options.offset.top
  $('.sidebar').data('bs.affix', _.extend($('.sidebar').data('bs.affix'), {
    options: {target: window, offset:
      top: originalOffset - 80
      bottom: -> (@bottom = $('.footer').outerHeight(true))
  }}))

Template.notification.events
  'click #notification .close': updateSession
  'click #notification .close spam': updateSession
