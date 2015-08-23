@Pictures = new Mongo.Collection('pictures')

# Permissions: admins will be able to
# create, update, and destroy every picture

requireUser = (userId, doc) -> !! userId

@Pictures.allow
  insert: requireUser
  update: requireUser
  remove: requireUser

Meteor.methods
  insertPicture: (attributes) ->
    picture = _.extend(attributes, {
      userId: Meteor.user()._id
      submitted: new Date
    })
    
    _id: Pictures.insert(picture)
