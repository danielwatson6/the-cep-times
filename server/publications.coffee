Meteor.publish 'articles', (options, queryOptions) ->
  Articles.find(queryOptions, options)

Meteor.publish 'article', (id) ->
  check(id, String)
  Articles.find(id)

Meteor.publish 'albums', ->
  Albums.find()

Meteor.publish 'pictures', ->
  Pictures.find()
