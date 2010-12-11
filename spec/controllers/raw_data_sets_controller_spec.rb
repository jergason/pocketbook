require 'spec_helper'

describe RawDataSetsController do

  include Devise::TestHelpers
  render_views

  def mock_users(stubs={})
    @user ||= Factory(:user)
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
        expect do
          post :create, :raw_data_set => @attr
        end.to_not change(RawDataSet, :count)
      end
    end

    describe "logged in user" do
      before do
        log_in_test_user
      end

      it "should create a raw_data_set when the user is logged in" do
        expect do
          post :create, :raw_data_set => @attr
        end.to change(RawDataSet, :count).by(1)
      end

      it "should display a flash message upon successful creation" do
        post :create, :raw_data_set => @attr
        flash[:success].should =~ /created your data set/i
      end

      it "should work when there is no upload" do
        expect do
          post :create, :raw_data_set => @attr.merge({ :data_file => nil })
        end.to change(RawDataSet, :count).by(1)
        response.should be_redirect
      end
    end
  end

  describe "API stuff" do
    pending "add tests for doing stuff with JSON or XML"
  end
end
