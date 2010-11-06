class SearchController < ApplicationController
  def search_form
  end

  def search
    @title = "Search"
    #@organisms = RawDataSet.only(:organism_name)
    #@mass_spec_types = RawDataSet.only(:mass_spec_type)
    #@spec_type = RawDataSet.only(:mass_spec_type)

    unless params[:q].nil?
      @raw_data_sets = RawDataSet.find(:all, :conditions => { :organism_name => params[:organism_name] })
    end
  end
end
