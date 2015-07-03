Template.sidebar.helpers
  categories: -> (categories[c] for c of categories)

# Part of hack to fix sidebar, called in template
@trackSidebarScroll = (w, h) ->
  $(window).scroll ->
    doc = document.documentElement
    scrollHeight = (window.pageYOffset or doc.scrollTop)  - (doc.clientTop or 0)
    
    fixSidebar = ->
      $('.sidebar').css('position', 'fixed').css('top', 0).width(w)
    
    normalizeSidebar = ->
      $('.sidebar').css('position', 'static')
    
    if scrollHeight > h
      fixSidebar()
    else
      normalizeSidebar()
