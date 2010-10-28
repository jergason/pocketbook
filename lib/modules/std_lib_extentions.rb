#extend the standard libraries with some useful methods

#add a method on the string class to whitelist
#certain characters for shell commands.
#Prevent shell injection.
#Only allow alphanumeric characters and characters you would find
# in paths, file names (wildcard chars like *, underscores, /) or tranche hashes
class String
  def shell_escape
    self.gsub(%r{[^/\w\*\+=]}, "")
  end
end
