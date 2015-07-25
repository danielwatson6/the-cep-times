Template.sidebar.helpers
  categories: -> (categories[c] for c of categories)

Template.sidebar.rendered = ->
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
      # TO-DO: add bottom affix
      sidebar.affix
        offset:
          top: sidebar.offset().top
  
  # Since Meteor avoids re-rendering the sidebar even
  # switching between templates, we check if the affix
  # is necessary and toggle accordingly.
  setInterval(affixSidebar, 100)
