Template.sidebar.helpers
  categories: -> (categories[c] for c of categories)

Template.sidebar.rendered = ->
  sidebar = $('.sidebar')
  w = sidebar.width()
  h = sidebar.offset().top
  # Fix sidebar to top once it reaches top of window
  $(window).scroll ->
    h = sidebar.offset().top if not sidebar.hasClass('sidebar-fixed')
    sidebar.toggleClass('sidebar-fixed', $(@).scrollTop() > h)
           .find('img').css('width', w)
