Feature: Manage locations
  In order to manage locations
  As a user
  I want to create and edit my locations.
  
  Scenario: Create a new location
	Given I am on new location page
	And I fill in "Name" with "location 1"
	And press "Create"
	Then I should see "location 1"

  Scenario: Edit a location
	Given there is a location named "location 1"
	When I change the location name to "location has changed"
	Then I should see "location has changed"

  Scenario: Delete a location
    Given the following location records
      | name       |
      | location 1 |
      | location 2 |
      | location 3 |
      | location 4 |
    And I delete the 3rd location
    Then I should see "location 1"
    And I should see "location 2"
    And I should see "location 4"


  Scenario: Register a child location
    Given the following location record
      | name       |
      | location 1 |
	And I am on new location page
	When I fill in "Name" with "location 2"
	And I select "location 1" from "Parent"
	And press "Create"
	Then I should see "location 2"

  Scenario: List a location and it's children
    Given the following location records
      | name       | parent_id |
      | location 1 |           |
      | location 2 | 1         |
	And I am on the "location 1" page
	Then I should see "location 1"
	And I should see "location 2"