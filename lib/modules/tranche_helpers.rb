module TrancheHelpers
  include FilesystemHelpers

  # Use tranche download utility to download a file
  # and compress it for easy downloading to the user.
  def download_file_from_tranche(tranche_hash)
    path_to_download_utility = "#{Rails.root}/app/tranche/pc-tranche-get.jar"
    save_location = "#{Rails.root}/tmp/#{tranche_hash.shell_escape}"
    command = "java -jar #{path_to_download_utility} #{tranche_hash} #{save_location}"
    system(command)
    compress_folder(save_location)
  end  

  # Run the tranche upload utility, and return the hash it returns.
  def upload_file_to_tranche(file_path)
    path_to_upload_util = Rails.root.join("app", "tranche", "pc-tranche-add.jar")
    tranche_command  = "java -jar #{path_to_upload_util} --login example@foo.com foobar #{file_path}"
    res = `#{tranche_command}`
    #TODO: add some error testing
  end
end
