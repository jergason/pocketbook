require 'spec_helper'

describe User do
  before do
    @attr = {
      :username => "Jimbob McDaniels",
      :password => "password",
      :email => "foobar_1@example.com"
    }
  end

  it "should create a new user correctly" do
    @user = User.create!(@attr)
    User.count.should == 1
    @user.id.should_not be_nil
  end

  it "should increment the number of users when created" do
    #todo: figure out why the @user variable goes away after the first test
  end

  it "should have a user id" do
  end

  it "should have a raw_data_sets attribute" do
    @user = User.new(@attr)
    @user.should respond_to(:raw_data_sets)
  end

  describe "validations" do
    it "should require a valid username" do
      no_name_user = User.new(@attr.merge({ :username => "" }))
      no_name_user.should_not be_valid
    end
  end

  describe "raw data set associations" do
    before do
      @user = User.create(@attr)
      @raw_data_set_1 = Factory(:raw_data_set, :user => @user, :created_at => 1.day.ago)
      p @raw_data_set_1
      @raw_data_set_2 = Factory(:raw_data_set, :user => @user, :created_at => 1.hour.ago)
    end

    it "should return all raw_data_sets associated with a specific user" do
      @user.raw_data_sets.include?(@raw_data_set_1).should be_true
      @user.raw_data_sets.include?(@raw_data_set_2).should be_true
    end
      
  end
end
