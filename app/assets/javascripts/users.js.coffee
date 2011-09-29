$ ->
  do bind_callbacks

bind_callbacks = ->
  $('.unfollow_user').bind 'ajax:success', unfollow_callback
  $('.follow_user').bind 'ajax:success', follow_callback

unfollow_callback =  ->
  $('.unfollow_user').removeClass('unfollow_user')
                     .addClass('follow_user')
                     .unbind()
                     .attr('data-method','put')
                     .text('watch')
  do bind_callbacks

follow_callback =  ->
  $('.follow_user').removeClass('follow_user')
                   .addClass('unfollow_user')
                   .unbind()
                   .attr('data-method','delete')
                   .text('watching')
  do bind_callbacks
