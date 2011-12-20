Feature: Manage locations
  In order to manage locations
  As a user
  I want to create and edit my locations.
  
  Scenario: Register new role
	Given I am on new location page
	And I fill in "Name" with "location 1"
	And press "Create"
	Then I should see "location 1"
