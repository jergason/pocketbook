module TrancheHelpers
  #for right now we just use the java command line thing to
  #download data from tranche. We need at least a hash to
  #get a file, and optionally a certificate as well.
  #Assume we just need a hash for now.
  def download_file_from_tranche(tranche_hash)
    path_to_download_utility = "#{Rails.root}/app/tranche/pc-tranche-get.jar"
    save_location = "#{Rails.root}/tmp/#{tranche_hash.shell_escape}"
    command = "java -jar #{path_to_download_utility} #{tranche_hash} #{save_location}"
    system( command )
    compress_folder(save_location)
  end  

  def upload_file_to_tranche(file_path)
    "zklhweofihlksh++hlfk=="
  end
end
