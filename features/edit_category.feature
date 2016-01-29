Feature: Edit Category
  As a blog administrator
  In order to allow articles to be properly & dynamically categorized
  I want to be able to edit custom categories on my blog
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    Given I am on the admin home page
    When I follow "Categories"
    Then I should be on the admin categories page
    
  Scenario: Sucessfully Edit New Category from admin panel
    
    Then I should see "General"
    When I follow "General"
    When I fill in "Name" with "JBB Category"
    And I press "Save"
    Then I should be on the admin categories page
    And I should see "JBB Category"
    And I should not see "General"
    
  Scenario: Unsuccesfully edit category (cancel out given no validations)
   