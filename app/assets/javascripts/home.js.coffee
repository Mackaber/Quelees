# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@App =
  subscribeToFBSessionChange: ->
    FB.Event.subscribe('auth.sessionChange', (response) ->
      if response.session
      # A user has logged in, and a new cookie has been saved
      else
      # The user has logged out, and the cookie has been cleared
        App.clearSession()
    )
  clearSession: ->
    window.location = '/users/sign_out'
  logout: ->
    FB.getLoginStatus((response) ->
      FB.logout() if response.status == 'connected'
    )
    App.clearSession()

$ ->
  # Initialization code goes here
  App.subscribeToFBSessionChange()