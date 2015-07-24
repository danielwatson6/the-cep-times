Meteor.publish 'articles', ->
  Articles.find()

Meteor.publish 'albums', ->
  Albums.find()

Meteor.publish 'photos', ->
  Photos.find()
