require 'spec_helper'

describe RawDataSetsController do

  render_views

  before do
    @rds = Factory(:raw_data_set)
    RawDataSet.create!(@rds)
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => @rds.id
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'download'" do
    it "should be successful" do
      get 'download'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end

end
