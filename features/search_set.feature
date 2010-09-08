Feature: Manage Searches
   In order to search the forums and organize posts
   As a telescope user
   
   Scenario: There are some posts that are part of a search_set I should see the correct amount of posts
      Given the following posts exist
   		| title | body                         | id     | topic_id  | user_agent |
   		| Hello | How are you today?           | 1      | null      | cucumber   |
   		| Good  | Good thanks what about you?  | 2      | 1         | cucumber   | 
   		| Great | I am great today             | 3      | 1         | cucumber   |
		And I go to path "/users/sign_up"
      And I fill in "user[name]" with "Stewart"
      And I fill in "user[email]" with "stewart@somewhere.com"
      And I fill in "user[password]" with "secret"
      And I fill in "user[password_confirmation]" with "secret"
      And I click button "Sign up"
   	And I go to Stewart's confirmation page
   	And I fill in "search_set[search_query_string]" with "Hello"
   	And I click button "Save"
   	And I go to the home page
   	When I rebuild the search index
   	And I go to the home page
   	Then I should see "Stewart"
   	And I should see "Hello"