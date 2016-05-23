Feature: Access to Merge Articles
  As a blog administrator
  In order to limit access to articles
  I want to be able to merge articles

Background: articles to be merged
  
   	Scenario: the merged article should have one author
 	  Given the blog is set up
  	When I am logged in as a non-admin
  	And I follow "New Article"
  	And I fill in "article_title" with "Article1"
  	And I fill in "article__body_and_extended_editor" with "test1"
  	And I press "Publish"
  	And I log out
  	And I am logged into the admin panel
  	And I follow "New Article"  	
  	And I fill in "article_title" with "Article2"
  	And I fill in "article__body_and_extended_editor" with "test2"
  	And I press "Publish"
  	And I follow "Articles"
  	And I follow "Article1"
    When I fill in "merge_with" with 1
    And I press "Merge"
  	And I follow "Articles"
    And I should not see admin in author
  Scenario: An admin should be able to see the merge button
  	Given the blog is set up
  	When I am logged into the admin panel
  	And I follow "New Article"
  	And I fill in "article_title" with "Article 2"
  	And I fill in "article__body_and_extended_editor" with "test2"
  	And I press "Publish"
  	And I follow "Article 2"
  	Then I should see "Merge"
  Scenario: The merged article should contain the text of both previous articles and the title of the new article should be the title from either one of the merged articles.
   Given the blog is set up
  	When I am logged into the admin panel
  	And Article "test1" with id "1" body "test" exists
  	And Article "test2" with id "2" body "test2" exists
  	And I follow "Articles"
  	And I follow "test1"
    When I fill in "merge_with" with 1
    And I press "Merge"
  	And I follow "Articles"
  	And I should not see "test1"
  	And I follow "test2"
    Then I should see "test"
    Then I should see "test2"
  Scenario: A non-admin cannot merge two articles
  	Given the blog is set up
  	And I am logged in as a non-admin
 	  And I follow "All Articles"
 	  And I follow "Hello World!"
 	  Then I should not see "Merge"
 	  
 	Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article  
 	  Given the blog is set up
  	When I am logged into the admin panel
  	And I follow "New Article"
  	And I fill in "article_title" with "Article1"
  	And I fill in "article__body_and_extended_editor" with "test1"
  	And I press "Publish"
  	And I follow "New Article"
  	And I fill in "article_title" with "Article2"
  	And I fill in "article__body_and_extended_editor" with "test2"
  	And I press "Publish"
  	And I am on the home page
    And I comment "Article1" with "comment1" by "ss"
  	When I am on the home page
    And I comment "Article2" with "comment2" by "aa"
  	And I visit admin page
  	And I follow "Articles" 
  	And I follow "Article1" 
  	When I fill in "merge_with" with 1 
  	And I press "Merge"
  	And I am on the home page
  	And I click "Article2"
    Then page should have "comment1"
    Then page should have "comment2"