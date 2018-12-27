Feature: Example Scenario

  @example
  Scenario: Search Google
    Given I have navigated to the "google home" page
    When I fill in "the search field" with the text "rgwhitaker github"
    And I click on "the google search button"
    Then the page contains the following content "Automation Engineer Java ATG eCommerce"