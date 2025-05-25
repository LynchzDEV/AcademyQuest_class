Feature: Quest Page
  As a user
  I want to manage my quests
  So that I can track my tasks and achievements

  Background:
    Given there are no quests

  Scenario: Viewing the quest list when there are no quests
    When I visit the quests index page
    Then I should see "Quests" as the page title
    And I should see "No quests found."
    And I should see a link to create a new quest

  Scenario: Creating a new quest
    When I visit the quests index page
    And I click on "New quest"
    Then I should see the new quest form
    When I fill in "Name" with "Defeat the dragon"
    And I click on "Create Quest"
    Then I should see "Quest was successfully created."
    And I should see "Defeat the dragon"

  Scenario: Viewing quest details
    Given there is a quest named "Rescue the princess"
    When I visit the quests index page
    And I click on "Show" for "Rescue the princess"
    Then I should see "Showing quest"
    And I should see "Rescue the princess"

  Scenario: Editing a quest
    Given there is a quest named "Find the treasure"
    When I visit the quests index page
    And I click on "Show" for "Find the treasure"
    And I click on "Edit this quest"
    And I fill in "Name" with "Find the golden treasure"
    And I click on "Update Quest"
    Then I should see "Quest was successfully updated."
    And I should see "Find the golden treasure"

  Scenario: Deleting a quest
    Given there is a quest named "Defeat the goblin"
    When I visit the quests index page
    And I click on "Destroy" for "Defeat the goblin"
    Then I should see "Quest was successfully destroyed."
    And I should not see "Defeat the goblin"
