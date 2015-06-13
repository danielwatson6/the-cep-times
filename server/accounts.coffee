allowedEmails = [
  'watsondaniel6@gmail.com'
  'carlosgalan1107@hotmail.com'
  'sophiaeleta@gmail.com'
  'christineortiz7@hotmail.com'
  'rada.amira@hotmail.com'
]

Accounts.config
  sendVerificationEmail: true

# Only allow the pre-specified users
Accounts.validateNewUser (user) ->
  if user.email in allowedEmails
    return true
  throw new Meteor.Error(403, "You do not have permission to create a user.")
