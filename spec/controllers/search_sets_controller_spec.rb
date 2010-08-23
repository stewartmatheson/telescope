require 'spec_helper'

describe SearchSetsController do

  def mock_search_set(stubs={})
    @mock_search_set ||= mock_model(SearchSet, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all search_sets as @search_sets" do
      SearchSet.stub(:all) { [mock_search_set] }
      get :index
      assigns(:search_sets).should eq([mock_search_set])
    end
  end

  describe "GET show" do
    it "assigns the requested search_set as @search_set" do
      SearchSet.stub(:find).with("37") { mock_search_set }
      get :show, :id => "37"
      assigns(:search_set).should be(mock_search_set)
    end
  end

  describe "GET new" do
    it "assigns a new search_set as @search_set" do
      SearchSet.stub(:new) { mock_search_set }
      get :new
      assigns(:search_set).should be(mock_search_set)
    end
  end

  describe "GET edit" do
    it "assigns the requested search_set as @search_set" do
      SearchSet.stub(:find).with("37") { mock_search_set }
      get :edit, :id => "37"
      assigns(:search_set).should be(mock_search_set)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created search_set as @search_set" do
        SearchSet.stub(:new).with({'these' => 'params'}) { mock_search_set(:save => true) }
        post :create, :search_set => {'these' => 'params'}
        assigns(:search_set).should be(mock_search_set)
      end

      it "redirects to the created search_set" do
        SearchSet.stub(:new) { mock_search_set(:save => true) }
        post :create, :search_set => {}
        response.should redirect_to(search_set_url(mock_search_set))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved search_set as @search_set" do
        SearchSet.stub(:new).with({'these' => 'params'}) { mock_search_set(:save => false) }
        post :create, :search_set => {'these' => 'params'}
        assigns(:search_set).should be(mock_search_set)
      end

      it "re-renders the 'new' template" do
        SearchSet.stub(:new) { mock_search_set(:save => false) }
        post :create, :search_set => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested search_set" do
        SearchSet.should_receive(:find).with("37") { mock_search_set }
        mock_search_set.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :search_set => {'these' => 'params'}
      end

      it "assigns the requested search_set as @search_set" do
        SearchSet.stub(:find) { mock_search_set(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:search_set).should be(mock_search_set)
      end

      it "redirects to the search_set" do
        SearchSet.stub(:find) { mock_search_set(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(search_set_url(mock_search_set))
      end
    end

    describe "with invalid params" do
      it "assigns the search_set as @search_set" do
        SearchSet.stub(:find) { mock_search_set(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:search_set).should be(mock_search_set)
      end

      it "re-renders the 'edit' template" do
        SearchSet.stub(:find) { mock_search_set(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested search_set" do
      SearchSet.should_receive(:find).with("37") { mock_search_set }
      mock_search_set.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the search_sets list" do
      SearchSet.stub(:find) { mock_search_set }
      delete :destroy, :id => "1"
      response.should redirect_to(search_sets_url)
    end
  end

end
