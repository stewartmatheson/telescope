Feature: Manage Posts
   In order to allow users to view all posts
   As a User
   I want to be able to view all posts
      
   Scenario: I have a post with 2 replies
      Given the following posts exist
			| title | body                         | id     | topic_id  | user_agent | 
			| Hello | How are you today?           | 1      | null      | cucumber   | 
			| Good  | Good thanks what about you?  | 2      | 1         | cucumber   |  
			| Great | I am great today             | 3      | 1         | cucumber   |
		Then the post with id = 1 should have 2 replies
		And the post with id = 2 should have a topic with id = 1
		
	Scenario: The post is visible
	   When I go to the home page
	   Then I should see "Create Post"
	   
	Scenario: The reply is created with the correct post
	   Given the following posts exist
			| title | body                         | id     | topic_id  | user_agent | 
			| Hello | How are you today?           | 1      | null      | cucumber   |
			| Good  | Good thanks what about you?  | 2      | 1         | cucumber   |  
			| Great | I am great today             | 3      | 1         | cucumber   |
	   And I am using FireFox
	   When I go to path "/posts/1"
	   And I fill in "post[title]" with "Test post"
	   And I fill in "post[body]" with "This is the body"
	   And I click button "Create Post"
	   Then I should see "Test post"
	   And I should see "This is the body"
	   
	Scenario: Posts supports many replies
	   Given the following posts exist
			| title | body                         | id     | topic_id  | user_agent | 
			| Hello | How are you today?           | 1      | null      | cucumber   |
			| Good  | Good thanks what about you?  | 2      | 1         | cucumber   |  
			| Great | I am great today             | 3      | 1         | cucumber   |
	   And I am using FireFox
	   When I go to path "/posts/1"
	   And I fill in "post[title]" with "Test post"
	   And I fill in "post[body]" with "This is the body"
	   And I click button "Create Post"
	   And I fill in "post[title]" with "Another test post"
	   And I fill in "post[body]" with "Another body"
	   And I click button "Create Post"
	   Then I should see "Test post"
	   And I should see "This is the body"
	   And I should see "Another test post"
	   And I should see "Another body"
	   	   
	Scenario: Posts supports correct prefix count
	   Given the following posts exist
			| title                 | body                         | id     | topic_id  | user_agent | 
			| [news] [help] Hello   | How are you today?           | 1      | null      | cucumber   |
			| [news] title          | Good thanks what about you?  | 2      | 1         | cucumber   |  
			| Great                 | I am great today             | 3      | 1         | cucumber   |
		Then The post "[news] title" should have a prefix count of 1
		And The post "[news] [help] Hello" should have a prefix count of 2
		And The post "[news] title" should have a title with out the prefix of "title"
		And The post "[news] [help] Hello" should have a title with out the prefix of "Hello"