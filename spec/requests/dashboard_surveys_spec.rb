require 'spec_helper'

describe 'dashboard survey features' do

  before :each do
    @user = Factory :user
    login_user @user
  end

  it "should display his own surveys" do
    @user.questionnaires.create(:name => "ownsurvey")
    visit root_path
    page.find('.surveys').should have_content "ownsurvey"
  end

  describe "given watches another user" do
    before :each do 
      @watched_user = Factory :user
      @user.follow! @watched_user
    end

    it "should display watched user surveys" do
      @watched_user.questionnaires.create(:name => "watchedsurvey", :is_public => true)
      visit root_path
      page.find('.latest-surveys').should have_content "watchedsurvey"
    end

    it "should not display watched user private surveys" do
      @watched_user.questionnaires.create(:name => "privatewatchedsurvey", :is_public => false)
      visit root_path
      page.find('.latest-surveys').should have_no_content "privatewatchedsurvey"
    end
  end

end
