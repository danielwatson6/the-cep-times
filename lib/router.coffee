Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'
  waitOn: -> Meteor.subscribe('articles')

Router.route '/',
  name: 'articleIndex'
Router.route '/articles/new',
  name: 'articleNew'
Router.route '/articles/:_id',
  name: 'articleShow'
  data: -> Articles.findOne(@params._id)
Router.route '/articles/:_id/edit',
  name: 'articleEdit'
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

requireLogin = ->
  if ! Meteor.user()
    if Meteor.loggingIn()
      @render(@loadingTemplate)
    else
      @render('accessDenied')
  else
    @next()

# Hook to show 404 whenever the object is falsy
Router.onBeforeAction('dataNotFound', only: 'articleShow')

# Hook to require login to access routes
Router.onBeforeAction(requireLogin, only: ['articleNew'])
