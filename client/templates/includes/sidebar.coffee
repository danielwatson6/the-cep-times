Template.sidebar.helpers
  categories: -> (categories[c] for c of categories)

$(window).on 'scroll', (e) ->
  doc = document.documentElement;
  top = (window.pageYOffset or doc.scrollTop)  - (doc.clientTop or 0)
  
  if top < 750
    $('.sidebar').removeClass('fixed-to-top')
  else
    $('.sidebar').addClass('fixed-to-top')
