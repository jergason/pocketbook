module ApplicationHelper
  #define a uniform title for the site
  def title
    base_title = "PocketBook Mass Spec Proteomics Database"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
