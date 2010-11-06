require 'spec_helper'

describe SearchController do

  describe "GET 'search'" do
    it "should be successful" do
      get 'search'
      response.should be_success
    end

    pending "check on the actual search functionality"
    pending "check on the autocomplte functionality"
  end

end
