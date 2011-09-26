require 'spec_helper'

module UserSpecHelper
  def valid_user_attributes
    { :email => "badosu@badosu.com",
      :name => "badosu",
      :password => "badosu" }
  end
end

describe User do

  include UserSpecHelper

  fixtures :users

  before :each do
    @user = User.new
  end

  it "should be invalid when empty" do
    @user.should be_invalid
  end

  it "should be invalid when email is not valid" do
    @user.attributes = valid_user_attributes.except :email
    @user.email = "badosu"
    @user.should be_invalid
  end

  it "name should have 5..15 characters" do
    @user.attributes = valid_user_attributes.except :name
    @user.name = "bado"
    @user.should be_invalid
    @user.name = "reallylooongname"
    @user.should be_invalid
  end

end
