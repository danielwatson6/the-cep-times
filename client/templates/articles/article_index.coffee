Template.articleIndex.helpers
  articles: -> Articles.find({}, sort: {submitted: -1})
  countIsPositive: -> Articles.find().count() isnt 0
