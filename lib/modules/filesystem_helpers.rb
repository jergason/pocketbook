#General Filesystem Stuff
module FilesystemHelpers
  def compress_folder(folder_path)
    compressed_path = "#{folder_path}.tar"
    compress_command = "tar -czf #{folder_path}.tar #{folder_path}/*"
    puts compress_command
    system(compress_command)
    compressed_path
  end

  def save_file_into_tmp_dir(io_stream)
    if io_stream
      file_path = Rails.root.join("tmp", "uploads", Time.now.to_i.to_s)
      File.open(file_path, 'w') { |file| file.write(io_stream.read) }
      file_path
    else
      nil
    end
  end
end
