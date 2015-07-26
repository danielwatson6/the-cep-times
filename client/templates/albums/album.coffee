Template.albumShow.helpers
  date: -> dateLocal.spanishDate(@submitted)

Template.albumShow.events
  'click .fa-trash-o': (e) ->
    if Meteor.user() and confirm("Are you sure you want to
      destroy this article? This action is irreversible.")
      Albums.remove(_id: @_id)
      navigate('albumIndex')
