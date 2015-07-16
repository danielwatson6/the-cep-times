Template.sidebar.helpers
  categories: -> (categories[c] for c of categories)

Template.sidebar.rendered = ->
  sidebar = $('.sidebar')
  w = sidebar.width()
  h = sidebar.offset().top
  # Compensate for Safari and Chrome rendering bug with
  # fixed position inside elements with relative position.
  # See https://github.com/twbs/bootstrap/issues/12126
  sidebar.parent().css('position', 'static')
  # Fix sidebar to top once it reaches top of window
  $(window).scroll ->
    h = sidebar.offset().top if not sidebar.hasClass('sidebar-fixed')
    sidebar.toggleClass('sidebar-fixed', $(@).scrollTop() > h)
           .find('img').css('width', w)
