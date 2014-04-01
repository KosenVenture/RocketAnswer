require "spec_helper"

describe AnswerFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/answer_files").should route_to("answer_files#index")
    end

    it "routes to #new" do
      get("/answer_files/new").should route_to("answer_files#new")
    end

    it "routes to #show" do
      get("/answer_files/1").should route_to("answer_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/answer_files/1/edit").should route_to("answer_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/answer_files").should route_to("answer_files#create")
    end

    it "routes to #update" do
      put("/answer_files/1").should route_to("answer_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/answer_files/1").should route_to("answer_files#destroy", :id => "1")
    end

  end
end
