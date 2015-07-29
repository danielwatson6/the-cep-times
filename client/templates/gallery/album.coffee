Template.albumItem.helpers
  coverURL: -> 
    "background-image: url(#{Pictures.findOne(album_id: @_id).url})"

Template.albumShow.helpers
  date: -> dateLocal.spanishDate(@submitted)
  pictures: -> Pictures.find(album_id: @_id)

Template.albumShow.events
  'click .fa-trash-o': (e) ->
    if Meteor.user() and confirm("Are you sure you want to
      destroy this article? This action is irreversible.")
      Albums.remove(_id: @_id)
      navigate('albumIndex')
