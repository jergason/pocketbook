class RawDataSetsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index, :download]
  def show
    @title = "Show"
    @raw_data_set = RawDataSet.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @raw_data_set.to_xml }
      format.json { render :json => @raw_data_set.to_json }
    end
  end

  def index
    @raw_data_sets = RawDataSet.all
  end

  def download
    #TODO: is this a valid tranche_hash?

    #TODO: Give them a progress bar while we are downloading
    # from Tranche, and then start the download normally.

    #TODO: change to send_data, more secure that way.
    #send_file(download_file_from_tranche(params[:tranche_hash]))
    #could be accessible by tranche hash or by id
  end

  def new
    @raw_data_set = RawDataSet.new
  end

  def create
    @raw_data_set = RawDataSet.new(params[:raw_data_set])
    uploaded_io = params[:raw_data_set][:raw_data]
    if @raw_data_set.save
      redirect_to @raw_data_set
    else
      render "new"
    end
  end
end
