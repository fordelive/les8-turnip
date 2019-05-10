Feature: User sign up

  Scenario: User opens sign up page via menu
    Given I am on home page
    When  I click sign up menu item on home page
    Then  I redirected to sign up page

  Scenario: User submits signing up information
    Given I am on sign up page
    When  I fill in sign up form with correct user's name, email, password and submit it
    Then  I see info on home page that confirmation link has been sent to email address
    And   I am not logged to the system
    And   I have received confirmation email
    When  I confirm account from confirmation email
    Then  I see on login page notification that account was successfully confirmed

  Scenario: User logs in with submitted credentials
    When  I fill and submit form on login page with correct data
    Then  I should be logged to the system
    And   I should be redirected to home page

