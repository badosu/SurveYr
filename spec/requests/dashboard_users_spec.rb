require 'spec_helper'

describe 'dashboard user features' do
  before :each do
    @user = Factory :user
    login_user @user
  end
  
  it "should show watched users" do
    watched = Factory :user
    @user.follow! watched
    visit root_path
    page.find('.watching').should have_content watched.name
  end
  
  it "should show watchers" do
    watcher = Factory :user
    watcher.follow! @user
    visit root_path
    page.find('.watchers').should have_content watcher.name
  end
end
