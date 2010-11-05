Factory.define :user do |user|
  user.username "Jimbob_McJangles"
  user.email "foobar@beans.com"
  user.password "password"
  user.password_confirmation "password"
end

Factory.define :raw_data_set do |rds|
  rds.organism_name "Homo Sapiens"
  rds.mass_spec_type "Orbitrap"
  rds.spectra_type "MS3"
  rds.association :user
end
