require 'spec_helper'

describe UsersController do

  before do
    @user = Factory(:user)
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
