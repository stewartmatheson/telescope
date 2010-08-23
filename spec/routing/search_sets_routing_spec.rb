require "spec_helper"

describe SearchSetsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/search_sets" }.should route_to(:controller => "search_sets", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/search_sets/new" }.should route_to(:controller => "search_sets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/search_sets/1" }.should route_to(:controller => "search_sets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/search_sets/1/edit" }.should route_to(:controller => "search_sets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/search_sets" }.should route_to(:controller => "search_sets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/search_sets/1" }.should route_to(:controller => "search_sets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/search_sets/1" }.should route_to(:controller => "search_sets", :action => "destroy", :id => "1")
    end

  end
end
