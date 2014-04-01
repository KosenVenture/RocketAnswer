require "spec_helper"

describe SchoolsController do
  describe "routing" do

    it "routes to #index" do
      get("/schools").should route_to("schools#index")
    end

    it "routes to #new" do
      get("/schools/new").should route_to("schools#new")
    end

    it "routes to #show" do
      get("/schools/1").should route_to("schools#show", :id => "1")
    end

    it "routes to #edit" do
      get("/schools/1/edit").should route_to("schools#edit", :id => "1")
    end

    it "routes to #create" do
      post("/schools").should route_to("schools#create")
    end

    it "routes to #update" do
      put("/schools/1").should route_to("schools#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/schools/1").should route_to("schools#destroy", :id => "1")
    end

  end
end
