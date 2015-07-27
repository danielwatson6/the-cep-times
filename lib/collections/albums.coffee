@Albums = new Mongo.Collection('albums')

# Permissions: admins will be able to
# create, update, and destroy every album

requireUser = (userId, doc) -> !! userId

@Albums.allow
  insert: requireUser
  update: requireUser
  remove: requireUser

Meteor.methods
  insertAlbum: (attributes) ->
    album = _.extend(attributes, {
      userId: Meteor.user()._id
      submitted: new Date
    })
    
    _id: Albums.insert(album)
