require 'spec_helper'

describe "search_sets/show.html.erb" do
  before(:each) do
    @search_set = assign(:search_set, stub_model(SearchSet,
      :user_id => 1,
      :search_query_string => "Search Query String"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("Search Query String".to_s)
  end
end
