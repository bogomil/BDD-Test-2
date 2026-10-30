Feature: User login
  As a registered user
  I want to log in with my credentials
  So that I can access my account

  Background:
    Given I am on the login page

  Scenario: Successful login with valid credentials
    When I enter username "valid.user@example.com"
    And I enter password "CorrectPassword1!"
    And I click the "Log in" button
    Then I should be redirected to the dashboard
    And I should see a welcome message

  Scenario: Login fails with an incorrect password
    When I enter username "valid.user@example.com"
    And I enter password "WrongPassword"
    And I click the "Log in" button
    Then I should remain on the login page
    And I should see the error "Invalid username or password"

  Scenario: Login fails with empty fields
    When I click the "Log in" button without entering any credentials
    Then I should see a validation message for the required fields

  Scenario Outline: Login fails with invalid input
    When I enter username "<username>"
    And I enter password "<password>"
    And I click the "Log in" button
    Then I should see the error "<error>"

    Examples:
      | username               | password          | error                           |
      | unknown@example.com    | AnyPassword1!     | Invalid username or password    |
      | valid.user@example.com |                   | Password is required            |
      |                        | CorrectPassword1! | Username is required            |
