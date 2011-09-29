window.remove_fields = (link) ->
  $(link).prev("input[type=hidden]").val true
  do $(link).parent().hide

window.add_fields = (link, association, content) ->
  new_id = do new Date().getTime
  regexp = new RegExp("new_" + association, "g")
  $(link).before content.replace(regexp, new_id)
