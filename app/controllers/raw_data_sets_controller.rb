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
    #TODO: use build and current_user to create the raw_data_set
    @raw_data_set = current_user.raw_data_sets.build(params[:raw_data_set])
    if @raw_data_set.save
      if params[:raw_data_set][:data_file]
        # Download the file into the tmp directory.
        uploaded_io = params[:raw_data_set][:data_file]
        file_path = Rails.root.join("tmp", "uploads", Time.now.to_i.to_s)
        File.open(file_path, 'w') { |file| file.write(uploaded_io.read) }

        # Send off a delayed job to upload the files to Tranche
        @raw_data_set.delay.upload(file_path)
      end
      flash[:success] = "Created your data set, and uploading it to tranche."

      redirect_to @raw_data_set
    else
      render "new"
    end
  end
end
