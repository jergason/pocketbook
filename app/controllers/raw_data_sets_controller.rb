#Manage uploaded data set creation and manipulation.
class RawDataSetsController < ApplicationController
  include FilesystemHelpers
  before_filter :authenticate_user!, :except => [:show, :index, :download]

  def show
    @title = "Show"
    @raw_data_set = RawDataSet.find(params[:id])
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
    #TODO: use build and current_user to create the raw_data_set
    @raw_data_set = current_user.raw_data_sets.build(params[:raw_data_set])
    if @raw_data_set.save
      # Handle an upload if there is one
        file_path = save_file_into_tmp_dir(params[:raw_data_set][:data_file])
        # Send off a delayed job to upload the files to Tranche
        if file_path
          @raw_data_set.delay.upload(file_path)
        end
        flash[:success] = "Created your data set, and uploading it to tranche."
      redirect_to @raw_data_set
    else
      # Go back to the form for creating a new raw
      # data set and display any errors.
      render :action => "new"
    end
  end
end

