require 'spec_helper'

describe RawDataSetsController do

  include Devise::TestHelpers
  render_views

  def mock_users(stubs={})
    @user ||= mock_model(User, stubs).as_null_object
  end

  def log_in_test_user
    attr = { :username => "Foobar", :email => "doineedit@foobar.com" }
    #mock up an authentication in warden
    request.env['warden'] = mock(Warden, :authenticate => mock_users(attr),
                                         :authenticate! => mock_users(attr),
                                         :authenticate? => mock_users(attr))
  end

  before do
    @rds = Factory(:raw_data_set)
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

    it "should be successful for logged in users" do
      log_in_test_user
      get :new
      response.should be_success
    end

    it "should not be successful for not logged in users" do
      get :new
      response.should_not be_success
    end
  end

  describe "POST 'create'" do

    before do
      @attr = Factory.attributes_for(:raw_data_set, :organism_name => "Savage Rhombus")
    end      

    describe "anonymous user" do
      it "should not work without a logged-in user" do
        lambda do
          post :create, :raw_data_set => @attr
        end.should_not change(RawDataSet, :count)
      end
    end

    describe "logged in user" do
      before do
        log_in_test_user
      end

      it "should create a raw_data_set when the user is logged in" do
        lambda do
          post :create, :raw_data_set => @attr
        end.should change(RawDataSet, :count).by(1)
      end
    end
  end

  describe "API stuff" do
    pending "add tests for doing stuff with JSON or XML"
  end
end
