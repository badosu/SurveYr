$('.follow_user').replaceWith "<%= escape_javascript(link_to "watching", user_follow_path(@user), :method => :delete, :remote => true, :class => 'unfollow_user btn')%>"
