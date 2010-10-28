class RawDataSetsController < ApplicationController
  def show
    @title = "Show"
    @raw_data_set = RawDataSet.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :json => @raw_data_set.to_json }
      format.json { render :xml => @raw_data_set.to_xml }
    end
  end

  def index
    @raw_data_sets = RawDataSet.all
  end

  def download
    #could be accessible by tranche hash or by id
  end

  def new
    @raw_data_set = RawDataSet.new
  end

  def create
  end

end
