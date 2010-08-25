Feature: Manage Searches
   In order to search the forums and organize posts
   As a telescope user
   
   Scenario: Making sure that a post shows in a search set when it should
      Given a post exists with title: "Hello", body: "What about you"
   	And I go to the home page
   	And fill in "main_search" with "Hello"
   	Then I should see "Hello"
   	And I should see "1 topics found"