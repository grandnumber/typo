Feature: Merge Articles
  As a blog administrator
  In order to merge like articles
  I want to see a merge form on the edit article page & merge articles
  
  
  Background:
    Given the blog is set up
  
    And the following articles exist:
        | id | title    | author    | user_id | body | allow_comments | published | published_at        | state     | type      |
        | 3  | Article1 | two       | 2       | body1| true           | true      | 2016-01-01 10:00:00 | published | article   |
        | 4  | Article2 | three     | 3       | body2| true           | true      | 2016-01-01 10:00:00 | published | article   |
    
    

    And the following comments exist:
        |id | type    | author  | body      | article_id| user_id   | created_at            |
        | 1 | Comment | one     | comment1  | 3         | 1         | 2016-01-01 10:00:00   |
        | 2 | Comment | two     | comment2  | 4         | 2         | 2016-01-01 10:00:00   |
    
  Scenario: Admin can sucessfully merge articles
    Given I am logged into the admin panel
    And I am on the edit page for "Article1"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    And I press "Merge"
    Then the article "Article1" should have body "body1 body2"
    And the comment "comment2" should belong to "Article1" 
    And I should be on the edit page for "Article1"

    
