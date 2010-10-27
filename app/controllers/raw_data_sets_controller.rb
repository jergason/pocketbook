class RawDataSetsController < ApplicationController
  def show
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
