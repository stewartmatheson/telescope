Feature: Manage Users
   In order to handle users
   As a site Administrator
   
   Scenario: Make sure that there is no user logged in
      Given there is no user logged in
      When I go to the home page
      Then I should see "Sign in"
   
   Scenario: Make sure a user is signed in afer they sign up
      When I go to path "/users/sign_up"
      And I fill in "user[name]" with "Stewart"
      And I fill in "user[email]" with "stewart@somewhere.com"
      And I fill in "user[password]" with "secret"
      And I fill in "user[password_confirmation]" with "secret"
      And I click button "Sign up"
      And I go to the home page
      Then I should see "Stewart"
      