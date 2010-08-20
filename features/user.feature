Feature: Manage Users
   In order to handle users
   As a site Administrator
   
   Scenario: Make sure that there is no user logged in
      Given there is no user logged in
      When I go to the home page
      Then I should see "Sign in"