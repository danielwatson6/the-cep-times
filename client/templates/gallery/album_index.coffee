Template.albumIndex.helpers
  albums: -> Albums.find({}, sort: {submitted: -1})
