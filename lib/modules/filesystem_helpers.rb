#General Filesystem Stuff
module FilesystemHelpers
  def compress_folder(folder_path)
    compress_command = "tar -czf #{folder_path}.tar #{folder_path}/*"
    puts compress_command
    system(compress_command)
    folder_path + ".tar"
  end
end

puts "loaded filesystem helpers"
