# == Schema Information
# Schema version: 20101104202312
#
# Table name: raw_data_sets
#
#  id             :integer         not null, primary key
#  organism_name  :string(255)
#  mass_spec_type :string(255)
#  spectra_type   :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer
#

class RawDataSet < ActiveRecord::Base
  belongs_to :user, :counter_cache => true

  # Make sure a malicious user can't change the user id of a raw data set.
  attr_accessible :organism_name, :mass_spec_type, :spectra_type

  delegate :username, :to => :user, :prefix => true
end
