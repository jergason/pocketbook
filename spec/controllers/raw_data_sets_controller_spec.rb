require 'spec_helper'

describe RawDataSetsController do

  include Devise::TestHelpers
  render_views

  def mock_users(stubs={})
    @user ||= mock_model(User, stubs).as_null_object
  end

  before do
    @rds = Factory(:raw_data_set)
    #mock up an authentication in warden
    request.env['warden'] = mock(Warden, :authenticate => mock_users,
                                         :authenticate! => mock_users,
                                         :authenticate? => mock_users)
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => @rds.id
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'download'" do
    it "should be successful" do
      get :download, :id => @rds.id
      response.should be_success
    end

    pending "test that a file is actually downloaded"
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "GET 'create'" do
    pending "test creation of a new raw data set"
  end

  describe "API stuff" do
    pending "add tests for doing stuff with JSON or XML"
  end
end
