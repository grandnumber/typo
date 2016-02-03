Feature: Merge Articles
  As a blog administrator
  In order to merge like articles
  I want to see a merge form on the edit article page & merge articles
  
  
  Background:
    Given the blog is set up
    And the following users exist:
    And the following articles exist:
    And the following comments exist:
    
  Scenario: Admin can sucessfully merge articles
    Given I am logged in as XXX
    And I am on the Edit page of Article with id XXX
    Then I should see "Merge Articles"
    When I fill in "Merge with" with "XXX+1"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Articles successfully merged!"
    
