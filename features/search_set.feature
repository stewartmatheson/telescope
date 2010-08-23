Feature: Manage Searches
   In order to search the forums and organize posts
   As a telescope user
   
   Scenario: Making sure that a post shows in a search set when it should
      Given a post exists with title: "Hello", body: "What about you"
   	And a search_set exists with search_query_string: "Hello"
   	When The search index is rebuilt
   	And I go to the home page
   	Then I should see "Hello"
   	And I should see "1 topic"