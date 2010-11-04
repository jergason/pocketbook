require 'spec_helper'

describe RawDataSet do
  before do
    @attr = {
      :organism_name => "Foobar",
      :mass_spec_type => "Orbitrap",
      :spectra_type => "MS3",
      :user_id => 1
    }
  end

  it "should create a new RawDataSet given valid information" do
    RawDataSet.create!(@attr)
  end
end
