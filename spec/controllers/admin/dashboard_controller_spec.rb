require 'spec_helper'

describe Admin::DashboardController do

  describe "GET 'top'" do
    it "returns http success" do
      get 'top'
      response.should be_success
    end
  end

end
