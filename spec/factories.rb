Factory.define :user do |user|
  user.sequence(:username) { |n| "jimbob_mcjangles_#{n}" }
  user.sequence(:email) { |n| "foobar_#{n}@beans.com" }
  user.password "password"
  user.password_confirmation "password"
end

Factory.define :raw_data_set do |rds|
  rds.organism_name "Homo Sapiens"
  rds.mass_spec_type "Orbitrap"
  rds.sequence(:tranche_hash) { |n| "xzhlksqoy_==_#{n}" }
  rds.association :user
end
