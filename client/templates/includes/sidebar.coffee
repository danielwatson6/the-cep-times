Template.sidebar.helpers
  categories: -> (categories[c] for c of categories)

# Part of hack to fix sidebar, called in template
@trackSidebarScroll = (w, h) ->
  $(window).scroll ->
    $('.sidebar').toggleClass('sidebar-fixed', $(@).scrollTop() > h)
                 .find('img').css('width', w)
