@join_us @javascript
Feature: Join us
  As an engineer
  I want to join the company

  Scenario: Show the join form
    Given I am on the homepage
    When I choose the join option
    Then I should see the join request form

  Scenario: Send join request
    When I send the join request
    Then email with my request should be sent
     And I should see a notification that my message sent

  Scenario: Error in request
    When I send the invalid join request
    Then I should see errors in my join request
