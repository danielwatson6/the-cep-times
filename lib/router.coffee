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

# Hook to show 404 whenever the object is falsy
Router.onBeforeAction('dataNotFound', only: 'articleShow')
