Feature: Display detailed info
  In order to learn about a feed item
  a visitor
  wants display the detailed information
  
  @javascript
  Scenario: Display details with javascript
    Given I am on the home page
    When I click "zentai,zentai suit, cheap zentai, zentai discount-Blue Shiny Full Body Zentai Sexy Zentai Catsuit"
    Then the detailed info should be visible
