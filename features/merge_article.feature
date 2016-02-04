Feature: Merge Articles
  As a blog administrator
  In order to merge like articles
  I want to see a merge form on the edit article page & merge articles
  
  
  Background:
    Given the blog is set up
  
    And the following articles exist:
        | id | title    | author    | user_id | body | allow_comments | published | published_at        | state     | type      |
        | 3  | Article1 | two       | 2       | body1| true           | true      | 2016-01-01 10:00:00 | published | article   |
        | 4  | Article2 | three     | 3       | body1| true           | true      | 2016-01-01 10:00:00 | published | article   |
    
    

    And the following comments exist:
        |id | type    | author  | body      | article_id| user_id   | created_at            |
        | 1 | Comment | one     | comment1  | 3         | 1         | 2016-01-01 10:00:00   |
        | 2 | Comment | two     | comment2  | 4         | 2         | 2016-01-01 10:00:00   |
    
  Scenario: Admin can sucessfully merge articles
    Given I am logged into the admin panel
    And I am on the edit page for "Article1"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with 4
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Articles successfully merged!"
    
#  Scenario: merged article should contain content from BOTH articles merged
#   Given the articles with ids 4 and 5 were merged
#   And I am on the home page
#   Then I should see "Article1"
#   When I follow "Article1"
#   Then I should see "body1"
#   And I should see "body2"
   
#   Scenario: merged article should only have one author
#   Given the articles with ids 4 and 5 were merged
#   Then author should be "vani" or "vars"
   
#   Scenario: Comments on both of the 2 merged articles should carry over
#     Given the articles with ids 4 and 5 were merged
#     And I am on the home page
#     Then I should see "Article1"
#     When I follow "Article1"
#     Then I should see "comment1"
#     And I should see "comment2"
    
#   Scenario: Title of the new article should be title of either of the merged articles
#     Given the articles with ids 4 and 5 were merged
#     And I am on the home page
#     Then I should see "Article1" or "Article2"
    
#   Scenario: If I am not an admin I cannot merge articles
#     Given I am logged in as "vani" with password "1234"
#     And I am on the Edit page of Article with id 3
#     Then I should not see "Merge Articles"

    
