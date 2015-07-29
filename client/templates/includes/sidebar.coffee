Template.sidebar.helpers
  categories: -> (categories[c] for c of categories)

Template.sidebar.rendered = ->
  # Wait for carousel image to be properly loaded.
  # Not doing this can cause a wrong affix calculation
  # as sidebar.offset().top may change as image loads.
  $('.carousel-inner .item img').on 'load', ->
    sidebar = $('.sidebar')
    # Make width uniform when position type changes
    sidebar.find('img').css('width', sidebar.width())
    # Compensate for Safari and Chrome rendering bug with
    # fixed position inside elements with relative position.
    # See https://github.com/twbs/bootstrap/issues/12126
    sidebar.parent().css('position', 'static')
    affixSidebar = ->
      if sidebar.height() > $('.col-md-8').height()
        sidebar.attr('data-spy', '')
      else
        sidebar.affix
          offset:
            top: sidebar.offset().top
            bottom: -> (@bottom = $('.footer').outerHeight(true))
    
    # Run the affix continously in case that sidebar
    # is not re-rendered when switching views
    setInterval(affixSidebar, 100)
  
