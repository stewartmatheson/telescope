Feature: Manage Posts
   In order to allow users to view all posts
   As a User
   I want to be able to view all posts
   
   Scenario: Create a post
      Given I have posts titled Hello, Welcome
      When I go to the home page
      Then I should see "Hello"
      And I should see "Welcome"