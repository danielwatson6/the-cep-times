# Only for admins
restrictedRoutes = [
  'articleNew'
  'articleEdit'
  'albumNew'
  'albumEdit'
]

# Fix for Router.go not working
# when called in helpers and events
@navigate = (route, options) ->
  Meteor.defer ->
    Router.go(route, options)

Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'
  waitOn: -> [
    Meteor.subscribe('articles')
    Meteor.subscribe('albums')
    Meteor.subscribe('pictures')
  ]

# Articles

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
Router.route '/categories/:category',
  name: 'categories'
  data: -> {category: @params.category}

# Gallery

Router.route '/gallery',
  name: 'albumIndex'
Router.route '/albums/new',
  name: 'albumNew'
Router.route '/albums/:_id',
  name: 'albumShow'
  data: -> Albums.findOne(@params._id)
Router.route '/albums/:_id/edit',
  name: 'albumEdit'
  data: -> Albums.findOne(@params._id)

# Individual Routes

Router.route '/admin',
  name: 'admin'
Router.route '/calendar',
  name: 'calendar'
Router.route '/staff',
  name: 'staff'

requireLogin = ->
  if ! Meteor.user()
    if Meteor.loggingIn()
      @render(@loadingTemplate)
    else
      @render('accessDenied')
  else
    @next()

# Hook to show 404 whenever the object is falsy
Router.onBeforeAction('dataNotFound', only: [
  'articleShow'
  'articleEdit'
  'albumShow'
  'albumEdit'
])

# Hook to require login to access routes
Router.onBeforeAction(requireLogin, only: restrictedRoutes)
