# Configuration

# Number of articles per pagination block
articlesLimit = 5

# Routes only for admins
restricted = [
  'articleNew'
  'articleEdit'
  'albumNew'
  'albumEdit'
  'notificationForm'
]

# Routes to show 404 error
show404 = [
  'articleShow'
  'articleEdit'
  'albumShow'
  'albumEdit'
]

# Keep both child controllers as DRY as possible
PaginationController = RouteController.extend
  increment: articlesLimit
  # Intended for override
  queryOptions: -> {}
  dataOptions: -> {}
  nextPath: ->
    @route.path(articlesLimit: @articlesLimit() + @increment)
  # Pagination
  articlesLimit: ->
    parseInt(@params.query.limit) or @increment
  findOptions: ->
    sort: {submitted: -1}
    limit: @articlesLimit()
  subscriptions: ->
    @articlesSub = Meteor.subscribe('articles', @findOptions(), @queryOptions())
  articles: ->
    Articles.find(@queryOptions(), @findOptions())
  data: ->
    hasMore = @articles().count() is @articlesLimit()
    nextPath = @nextPath()
    _.extend({
      articles: @articles()
      ready: @articlesSub.ready
      nextPath: if hasMore then nextPath else null
    }, @dataOptions())

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
    Meteor.subscribe('notifications')
  ]

# Articles

Router.route '/articles/new',
  name: 'articleNew'

Router.route '/articles/:_id',
  name: 'articleShow'
  waitOn: -> Meteor.subscribe('article', @params._id)
  data: -> Articles.findOne(@params._id)

Router.route '/articles/:_id/edit',
  name: 'articleEdit'
  waitOn: -> Meteor.subscribe('article', @params._id)
  data: -> Articles.findOne(@params._id)

@CategoriesController = PaginationController.extend
  template: 'categories'
  categoryObject: -> category: @params.category
  queryOptions: -> @categoryObject()
  dataOptions: -> @categoryObject()
  # Using the normal version seems to return
  # nothing, regardless of input.
  nextPath: ->
    newLimit = @articlesLimit() + @increment
    "/categories/#{@params.category}?limit=#{newLimit}"

@ArticleSearchController = PaginationController.extend
  template: 'articleSearch'
  # TO-DO: implement OR with tags
  queryObj: ->
    title: {$regex: ".*#{@params.query.q}.*", $options: 'i'}
  queryOptions: -> @queryObj()
  dataOptions: -> @queryObj()
  # Using the normal version seems to return
  # nothing, regardless of input.
  nextPath: ->
    newLimit = @articlesLimit() + @increment
    "/search?q=#{@params.query.q}&limit=#{newLimit}"

Router.route '/categories/:category',
  name: 'categories'

Router.route '/search',
  name: 'articleSearch'

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
Router.route '/notifications',
  name: 'notificationForm'
  data: -> Notifications.findOne()
Router.route '/calendar',
  name: 'calendar'
Router.route '/staff',
  name: 'staff'

# Pagination for articles

@ArticleIndexController = PaginationController.extend
  template: 'articleIndex'
  nextPath: ->
    newLimit = @articlesLimit() + @increment
    "/?limit=#{newLimit}"

Router.route '/',
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
