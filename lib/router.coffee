Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'
  waitOn: -> Meteor.subscribe('articles')

Router.route '/',
  name: 'articleIndex'
Router.route '/articles/:_id',
  name: 'articleShow'
  data: -> Articles.findOne(@params._id)
Router.route '/admin',
  name: 'admin'

redirectToArticleIndex = (pause) ->
  if Meteor.user()
    Router.go('articleIndex')
    @next()

# Hook to show 404 whenever the object is falsy
Router.onBeforeAction('dataNotFound', only: 'articleShow')

# Hook to redirect to article index after sign in
Router.onBeforeAction(redirectToArticleIndex, only: 'admin')
