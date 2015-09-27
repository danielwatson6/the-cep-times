allowedEmails = [
  'watsondaniel6@gmail.com'
  'carlosgalan1107@hotmail.com'
  'sophiaeleta@gmail.com'
  'christineortiz7@hotmail.com'
  'rada.amira@hotmail.com'
  'arada98@hotmail.com'
  'made.diazduru@yahoo.com'
]

# Only allow the pre-specified users
Accounts.validateNewUser (user) ->
  if user.emails[0].address in allowedEmails
    return true
  throw new Meteor.Error(403, "You do not have permission to create a user.")
