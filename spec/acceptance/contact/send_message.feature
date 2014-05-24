@send_message
Feature: Send message
  As a visitor
  I want to send message to the company
  So I can know more about it

  Scenario: Show the message form
    Given I am on the homepage
    When I choose the send message option
    Then I should see the send message form

  Scenario: Send message
    When I send message
    Then email with my message should be sent to "info@crasome.com"
     And I should see a notification that my message sent
