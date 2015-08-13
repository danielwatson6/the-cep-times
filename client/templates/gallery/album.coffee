Template.albumItem.helpers
  coverURL: -> 
    "background-image: url(#{Pictures.findOne(album_id: @_id).url})"
  processedTitle: -> @title.substring(0, 25) + "..."

Template.albumShow.helpers
  date: -> dateLocal.spanishDate(@submitted)
  pictures: -> Pictures.find(album_id: @_id).map (picture, index) ->
    picture.index = index
    picture

Template.albumShow.events
  'click .fa-trash-o': (e) ->
    if Meteor.user() and confirm("Are you sure you want to
      destroy this article? This action is irreversible.")
      Albums.remove(_id: @_id)
      navigate('albumIndex')
  'click .thumb': (e) ->
    index = $(e.target).parent().data('index')
    items = $('.carousel').find('.item')
    $(items).removeClass('active')
    $(items[index]).addClass('active')
