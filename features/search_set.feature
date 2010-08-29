Feature: Manage Searches
   In order to search the forums and organize posts
   As a telescope user
   
   Scenario: Making sure that a post shows in a search set when it should
      Given a post exists with title: "Hello", body: "What about you"
   	When I go to the home page
   	And fill in "search" with "Hello"
   	Then show me the page