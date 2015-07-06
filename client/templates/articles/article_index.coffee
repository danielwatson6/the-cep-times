Template.articleIndex.helpers
  articles: -> Articles.find({}, sort: {submitted: -1})
