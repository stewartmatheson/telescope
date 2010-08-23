require 'spec_helper'

describe "search_sets/new.html.erb" do
  before(:each) do
    assign(:search_set, stub_model(SearchSet,
      :new_record? => true,
      :user_id => 1,
      :search_query_string => "MyString"
    ))
  end

  it "renders new search_set form" do
    render

    rendered.should have_selector("form", :action => search_sets_path, :method => "post") do |form|
      form.should have_selector("input#search_set_user_id", :name => "search_set[user_id]")
      form.should have_selector("input#search_set_search_query_string", :name => "search_set[search_query_string]")
    end
  end
end
