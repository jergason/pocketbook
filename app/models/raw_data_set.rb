# == Schema Information
# Schema version: 20101118232640
#
# Table name: raw_data_sets
#
#  id             :integer         not null, primary key
#  organism_name  :string(255)
#  mass_spec_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer
#  tranche_hash   :string(255)
#

class RawDataSet < ActiveRecord::Base
  belongs_to :user, :counter_cache => true

  # Make sure a malicious user can't change the user id of a raw data set.
  attr_accessible :organism_name, :mass_spec_type, :tranche_hash

  validates_presence_of :user_id, :organism_name, :mass_spec_type
  validates_associated :user
  validates_length_of :organism_name, :in => 2..255

  delegate :username, :to => :user

  include TrancheHelpers

  def upload(file_path)
    hash = upload_file_to_tranche(file_path)
    self.tranche_hash = hash
    save
    File.delete(file_path)
  end
end
