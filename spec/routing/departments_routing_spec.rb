require "spec_helper"

describe DepartmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/departments").should route_to("departments#index")
    end

    it "routes to #new" do
      get("/departments/new").should route_to("departments#new")
    end

    it "routes to #show" do
      get("/departments/1").should route_to("departments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/departments/1/edit").should route_to("departments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/departments").should route_to("departments#create")
    end

    it "routes to #update" do
      put("/departments/1").should route_to("departments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/departments/1").should route_to("departments#destroy", :id => "1")
    end

  end
end
