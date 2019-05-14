Feature: Remember me
  Background:
    Given User is logged in with correct login and correct password and checked remember me

  Scenario: User stays logged in when Home page is reopened
    When  User reopens Home page with reopening browser
    Then  User is logged in

  Scenario: User stays logged out when Home page is reopened
    When  User logs out
    And   User reopens Home page with reopening browser
    Then  User is logged out