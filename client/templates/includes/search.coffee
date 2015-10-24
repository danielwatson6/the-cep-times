Template.search.events
  'submit form': (e) ->
    e.preventDefault()
    q = $(e.target).find('input').val()
    if q then navigate("/search?q=#{q}")
