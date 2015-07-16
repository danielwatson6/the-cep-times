Template.categoryCircle.helpers
  fa: -> 'fa-' + @fa
  color: -> 'background-color:' + @color

Template.categoryCircle.events
  'mouseover .category-circle': (e) ->
    $('[data-toggle="tooltip"]').tooltip()
