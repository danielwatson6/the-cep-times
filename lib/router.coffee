Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: -> Meteor.subscribe('articles')

Router.route('/', name: 'articleIndex')
