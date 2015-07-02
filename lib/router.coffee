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
Router.route '/staff',
  name: 'staff'
Router.route '/calendar',
  name: 'calendar'
Router.route '/categories/:category',
  name: 'categories'
  data: -> {category: @params.category}

redirectToArticleIndex = (pause) ->
  if Meteor.user()
    Router.go('articleIndex')
    @next()

# Hook to show 404 whenever the object is falsy
Router.onBeforeAction('dataNotFound', only: 'articleShow')
