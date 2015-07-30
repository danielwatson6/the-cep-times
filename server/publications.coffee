Meteor.publish 'articles', (options) ->
  check options,
    sort: Object,
    limit: Number
  Articles.find({}, options)

Meteor.publish 'article', (id) ->
  check id, String
  Articles.find(id)

Meteor.publish 'albums', ->
  Albums.find()

Meteor.publish 'pictures', ->
  Pictures.find()
