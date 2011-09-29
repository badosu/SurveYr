$('.unfollow_user').replaceWith "<%= escape_javascript(link_to "watch", user_follow_path(@user), :method => :put, :remote => true, :class => 'follow_user btn') %>"
