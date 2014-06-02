@hire_us @javascript
Feature: Hire us
  As a company or individual
  I want to hire the company
  To work for me

  Scenario: Show the hire form
    Given I am on the homepage
    When I choose the hire option
    Then I should see the hire request form

  Scenario: Send hire request
    When I send the hire request
    Then email with my request should be sent
     And I should see a notification that my message sent
