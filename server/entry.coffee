Meteor.startup ->
  Accounts.urls.resetPassword = (token) ->
    Meteor.absoluteUrl('reset-password/' + token)

  AccountsEntry =
    settings: {}

    config: (appConfig) ->
      @settings = _.extend(@settings, appConfig)

  @AccountsEntry = AccountsEntry

  Meteor.methods
    accountsCreateUser: (username, email, password) ->
      if username
        Accounts.createUser
          username: username,
          email: email,
          password: password,
          profile: AccountsEntry.settings.defaultProfile || {}
      else
        Accounts.createUser
          email: email
          password: password
          profile: AccountsEntry.settings.defaultProfile || {}
