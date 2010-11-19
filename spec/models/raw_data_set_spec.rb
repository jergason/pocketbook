require 'spec_helper'

describe RawDataSet do
  before do
    @user = Factory :user
    @attr = { 
      :organism_name => "Beef Jerky",
      :mass_spec_type => "My Stomach",
    }
  end

  describe "attributes" do
    it "should have a tranche_hash attribuite" do
      @rds = Factory(:raw_data_set)
      @rds.respond_to?(:tranche_hash).should be_true
    end

    it "should have a username attribute" do
      @rds = Factory(:raw_data_set)
      @rds.respond_to?(:username).should be_true
    end
  end

  it "should require a user id to create it" do
    RawDataSet.new(@attr).should_not be_valid
  end

  it "should create a new RawDataSet given valid information" do
    @user.raw_data_sets.create!(@attr)
  end

  describe "User association" do
    before do
      @raw_data_set = @user.raw_data_sets.create!(@attr)
    end
    
    it "should have a user attribute" do
      @raw_data_set.should respond_to :user
    end

    it "username attrubute should be the same as user.username" do
      @raw_data_set.username.should == @user.username
    end

    it "should have the correct user associated with it" do
      @raw_data_set.user_id.should == @user.id
      @raw_data_set.user.should == @user
    end
  end

  describe "upload" do
  end
end
