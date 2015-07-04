@Articles = new Mongo.Collection('articles')

@Articles.allow
  insert: (userId, doc) ->
    # only allow posting if user is logged in
    !! userId
