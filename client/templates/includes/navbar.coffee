# Used to make navbar HTML more maintainable
@insertCircle = (options) ->
  $('.navbar-right')
    .append($('<li>')
      .append($('<a>')
        .attr(href: options.href)
        .append($('<div>')
          .css('backgroundColor', options.color)
          .addClass('navbar-circle')
          .addClass('fa')
          .addClass('fa-' + options.fa))))
