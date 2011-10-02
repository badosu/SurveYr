def login_user(user)
  visit login_path
  fill_in "name", :with => user.name
  fill_in "password", :with => user.password
  click_button 'Login'
end
