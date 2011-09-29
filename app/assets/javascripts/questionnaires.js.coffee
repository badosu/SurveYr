window.remove_fields = (link) ->
  $(link).prev("input[type=hidden]").value = "1"
  do $(link).parent().hide

window.add_fields = (link, association, content) ->
  new_id = do new Date().getTime
  regexp = new RegExp("new_" + association, "g")
  $(link).prev().insertBefore content.replace(regexp, new_id)
