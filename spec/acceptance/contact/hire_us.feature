@hire_us
Feature: Hire us
  As a company or individual
  I want to hire the company
  To work for me

  Scenario: Show the hire us form
    Given I am on the homepage
    When I choose the hire us option
    Then I should see the hire us form

  Scenario: Send hire request
    When I send the hire request
    Then email with my request should be sent
     And I should see a notification that my message sent
