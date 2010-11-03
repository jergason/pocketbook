module StdLibExtentions
  #We want String in the global namespace. Without the 
  #:: operator, the module makes the class definition
  #refer to StdLibExtentions::String, which is incorrect.
  #See http://stackoverflow.com/questions/4079672/can-i-add-to-a-class-definition-from-inside-a-module/4079702#4079702
  class ::String
    def shell_escape
      self.gsub(%r{[^/\w\*\+=]}, "")
    end
  end
end
