# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$ ->
  $('.follow_user').bind 'ajax:success', followed_user $(this)

  $('.unfollow_user').bind 'ajax:success', unfollowed_user $(this)

  followed_user = element ->
    -> element.removeClass('.follow_user')
              .addClass('.unfollow_user')
              .unbind()
              .bind('ajax:success', unfollowed_user)
              .text('unfollow')

  unfollowed_user = element ->
    -> element.removeClass('.follow_user')
              .addClass('.unfollow_user')
              .unbind()
              .bind('ajax:success', unfollowed_user)
              .text('unfollow')
