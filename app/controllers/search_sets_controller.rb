class SearchSetsController < ApplicationController
  before_filter :redirect_if_not_logged, :only => [:create, :new, :delete, :edit]
  
  # GET /search_sets
  # GET /search_sets.xml
  def index
    if user_signed_in?
      @search_sets = SearchSet.where("user_id = ?", current_user.id)
    else
      @search_sets = SearchSet.where("user_id IS NULL")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @search_sets }
    end
  end

  # GET /search_sets/1
  # GET /search_sets/1.xml
  def show
    @search_set = SearchSet.find(params[:id])
    @topics = @search_set.topics(:page => params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @search_set }
    end
  end

  # GET /search_sets/new
  # GET /search_sets/new.xml
  def new
    @search_set = SearchSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @search_set }
    end
  end


  # POST /search_sets
  # POST /search_sets.xml
  def create
    @search_set = SearchSet.new(params[:search_set])

    respond_to do |format|
      if @search_set.save
        format.html { redirect_to(@search_set, :notice => 'Search set was successfully created.') }
        format.xml  { render :xml => @search_set, :status => :created, :location => @search_set }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @search_set.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end


  # DELETE /search_sets/1
  # DELETE /search_sets/1.xml
  def destroy
    @search_set = SearchSet.find(params[:id])
    @search_set.destroy

    respond_to do |format|
      format.html { redirect_to(search_sets_url) }
      format.xml  { head :ok }
      format.js
    end
  end
end
