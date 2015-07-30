# Configuration

# Number of articles per pagination block
articlesLimit = 5

# Routes only for admins
restricted = [
  'articleNew'
  'articleEdit'
  'albumNew'
  'albumEdit'
]

# Routes to show 404 error
show404 = [
  'articleShow'
  'articleEdit'
  'albumShow'
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
    # Omit articles for pagination
    Meteor.subscribe('albums')
    Meteor.subscribe('pictures')
  ]

# Articles

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

# Pagination for articles

@ArticleIndexController = RouteController.extend
  template: 'articleIndex'
  increment: articlesLimit
  articlesLimit: ->
    parseInt(@params.articlesLimit) or @increment
  findOptions: ->
    {sort: {submitted: -1}, limit: @articlesLimit()}
  subscriptions: ->
    @articlesSub = Meteor.subscribe('articles', @findOptions())
  articles: ->
    Articles.find({}, @findOptions())
  data: ->
    hasMore = @articles().count() is @articlesLimit()
    nextPath = @route.path(articlesLimit: @articlesLimit() + @increment)
    {
      articles: @articles()
      ready: @articlesSub.ready
      nextPath: if hasMore then nextPath else null
    }

Router.route '/:articlesLimit?',
  name: 'articleIndex'
    
# Hooks

requireLogin = ->
  if ! Meteor.user()
    if Meteor.loggingIn()
      @render(@loadingTemplate)
    else
      @render('accessDenied')
  else
    @next()

Router.onBeforeAction('dataNotFound', only: show404)
Router.onBeforeAction(requireLogin, only: restricted)
