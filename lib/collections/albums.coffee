@Albums = new Mongo.Collection('albums')

Meteor.methods
  insertAlbum: (attributes) ->
    album = _.extend(attributes, {
      userId: Meteor.user()._id
      submitted: new Date
    })
    
    _id: Albums.insert(album)
