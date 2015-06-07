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
