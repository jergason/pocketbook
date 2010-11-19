#General Filesystem Stuff
module FilesystemHelpers
  def compress_folder(folder_path)
    compressed_path = "#{folder_path}.tar"
    compress_command = "tar -czf #{folder_path}.tar #{folder_path}/*"
    puts compress_command
    system(compress_command)
    compressed_path
  end
end
