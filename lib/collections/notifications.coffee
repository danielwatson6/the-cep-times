@Notifications = new Mongo.Collection('notifications')

requireUser = (userId, doc) -> !! userId

@Notifications.allow
  insert: requireUser
  update: requireUser
  remove: requireUser
