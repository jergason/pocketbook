require 'spec_helper'

describe RawDataSet do
  before do
    @user = Factory :user
    @attr = { 
      :organism_name => "Beef Jerky",
      :mass_spec_type => "My Stomach",
      :spectra_type => "Digestion"
    }
  end

  it "should create a new RawDataSet given valid information" do
    @user.raw_data_sets.create!(@attr)
  end

  describe "User association" do
    before do
      @raw_data_set = @user.raw_data_sets.create!(@attr)
    end
    
    it "have a user attribute" do
      @raw_data_set.should respond_to :user
    end

    it "should have the correct user associated with it" do
      @raw_data_set.user_id should == @user.id
      @raw_data_set.user should == @user
    end
  end



end
