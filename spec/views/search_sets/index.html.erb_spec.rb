require 'spec_helper'

describe "search_sets/index.html.erb" do
  before(:each) do
    assign(:search_sets, [
      stub_model(SearchSet,
        :user_id => 1,
        :search_query_string => "Search Query String"
      ),
      stub_model(SearchSet,
        :user_id => 1,
        :search_query_string => "Search Query String"
      )
    ])
  end

  it "renders a list of search_sets" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Search Query String".to_s, :count => 2)
  end
end
