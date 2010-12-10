#Handle searching raw data sets
class SearchController < ApplicationController
  def search_form
  end

  def search
    @title = "Search"
    unless params[:q].nil?
      @raw_data_sets = RawDataSet.find(:all, :conditions => { :organism_name => params[:organism_name] })
    end
  end
end
