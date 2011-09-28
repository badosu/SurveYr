require 'spec_helper'

describe Questionnaire do

  it "should reject if has no user" do
    (Questionnaire.new).should be_invalid
  end

  it "should have a user method" do
    (Questionnaire.new).should respond_to(:user)
  end

end
