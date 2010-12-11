require 'spec_helper'

describe RawDataSet do
  let(:user) { Factory :user }
  let(:attr) { Factory.attributes_for(:raw_data_set) }

  context "attributes" do
    let(:rds) { Factory :raw_data_set }

    it "should have a tranche_hash attribuite" do
      rds.respond_to?(:tranche_hash).should be_true
    end

    it "should have a username attribute" do
      rds.respond_to?(:username).should be_true
    end

    it "should have an organism_name attribute" do
      rds.respond_to?(:organism_name).should be_true
    end

    it "should have a mass_spec_type attribute" do
      rds.respond_to?(:mass_spec_type).should be_true
    end
  end

  it "should require a user id to create it" do
    RawDataSet.new(attr).should_not be_valid
  end

  it "should create a new RawDataSet given valid information" do
    user.raw_data_sets.create!(attr)
  end

  context "User association" do
    let(:raw_data_set) { user.raw_data_sets.create!(attr) }

    it "should have a user attribute" do
      raw_data_set.should respond_to :user
    end

    it "username attrubute should be the same as user.username" do
      raw_data_set.username.should == user.username
    end

    it "should have the correct user associated with it" do
      raw_data_set.user_id.should == user.id
      raw_data_set.user.should == user
    end
  end

  describe "upload" do
  end

  context "validations" do
    it "should validate the presence of a user_id" do
      RawDataSet.create(attr).should_not be_valid
    end

    it "should validate the presence of an organism_name" do
      RawDataSet.create(attr.merge({ :organism_name => nil })).should_not be_valid
    end

    it "should validate presence of mass_spec_type" do
      RawDataSet.create(attr.merge({ :mass_spec_type => nil })).should_not be_valid
    end

    it "should validate presence of tranche_hash" do
      RawDataSet.create(attr.merge({ :tranche_hash => nil })).should_not be_valid
    end

    it "should reject organism_name longer than 255 characters" do
      RawDataSet.create(attr.merge({ :organism_name => "a" * 256 })).should_not be_valid
    end

    it "should reject mass_spec_type longer than 255 characters" do
      RawDataSet.create(attr.merge({ :mass_spec_type => "a" * 256 })).should_not be_valid
    end

    it "should reject organism_name shorter than 2 characters" do
      RawDataSet.create(attr.merge({ :organism_name => "a" })).should_not be_valid
    end

    it "should reject mass_spec_type shorter than 2 characters" do
      RawDataSet.create(attr.merge({ :mass_spec_type => "a"})).should_not be_valid
    end
  end
end
