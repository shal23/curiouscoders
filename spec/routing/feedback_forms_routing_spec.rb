require "spec_helper"

describe FeedbackFormsController do
  describe "routing" do

    it "routes to #index" do
      get("/feedback_forms").should route_to("feedback_forms#index")
    end

    it "routes to #new" do
      get("/feedback_forms/new").should route_to("feedback_forms#new")
    end

    it "routes to #show" do
      get("/feedback_forms/1").should route_to("feedback_forms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/feedback_forms/1/edit").should route_to("feedback_forms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/feedback_forms").should route_to("feedback_forms#create")
    end

    it "routes to #update" do
      put("/feedback_forms/1").should route_to("feedback_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/feedback_forms/1").should route_to("feedback_forms#destroy", :id => "1")
    end

  end
end
