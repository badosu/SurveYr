require 'spec_helper'

describe User do

  before :each do
    @user = Factory(:user)
  end

  it "should be invalid when empty" do
    (User.new).should be_invalid
  end

  it "should be invalid when email has not @" do
    @user.email = "badosu"
    @user.should be_invalid
  end

  it "should be invalid when email has not suffix" do
    @user.email = "badosu@domain"
    @user.should be_invalid
  end

  it "should be invalid when email has a bad suffix" do
    @user.email = "badosu@domain.-com"
    @user.should be_invalid
  end

  it "should be invalid when email has not a name" do
    @user.email = "@domain.com"
    @user.should be_invalid
  end

  it "should reject a duplicate name" do
    homonymous = Factory(:user)
    homonymous.name = @user.name
    homonymous.should be_invalid
  end

  it "should reject a duplicate email" do
    homonymous = Factory(:user)
    homonymous.name = @user.email
    homonymous.should be_invalid
  end

  it "should have a name with 5..15 characters" do
    @user.name = "heya"
    @user.should be_invalid
    @user.name = "reallylooongname"
    @user.should be_invalid
    @user.name = "normalname"
    @user.should be_valid
  end

  it "should create a new instance given valid attributes" do
    @user.save!
  end

  it "should reject duplicate users" do
    duplicated_user = User.new(@user.attributes)
    duplicated_user.should be_invalid
  end

  describe "relationships" do

    before :each do
      @followed = Factory(:user)
    end

    it "should have a relationships method" do
      @user.should respond_to(:relationships)
    end

    it "should have a relationships method" do
      @user.should respond_to(:relationships)
    end

    it "should have a following method" do
      @user.should respond_to(:following)
    end

    it "should have a following? method" do
      @user.should respond_to(:following?)
    end

    it "should have a follow! method" do
      @user.should respond_to(:follow!)
    end

    it "should follow another user" do
      @user.follow!(@followed)
      @user.should be_following(@followed)
    end

    it "should include the followed user in the following array" do
      @user.follow!(@followed)
      @user.following.should include(@followed)
    end

    it "should have an unfollow! method" do
      @user.should respond_to(:unfollow!)
    end

    it "should unfollow a user" do
      @user.follow!(@followed)
      @user.unfollow!(@followed)
      @user.should_not be_following(@followed)
    end

    it "should have a reverse_relationships method" do
      @user.should respond_to(:reverse_relationships)
    end

    it "should have a followers method" do
      @user.should respond_to(:followers)
    end

    it "should include the follower in the followers array" do
      @user.follow!(@followed)
      @followed.followers.should include(@user)
    end

  end

end
