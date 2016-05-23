Feature: Access to Merge Articles
  As a blog administrator
  In order to limit access to articles
  I want to be able to merge articles

Background: articles to be merged

  Scenario: An admin should be able to see the merge button
  	Given the blog is set up
  	When I am logged into the admin panel
  	And I follow "New Article"
  	And I fill in "article_title" with "Article 2"
  	And I fill in "article__body_and_extended_editor" with "test2"
  	And I press "Publish"
  	And I follow "Article 2"
  	Then I should see "Merge"
  Scenario: The merged article should contain the text of both previous articles
   Given the blog is set up
  	When I am logged into the admin panel
  	And Article "test1" with id "1" body "test" exists
  	And Article "test2" with id "2" body "test2" exists
  	And I follow "Articles"
  	And I follow "test1"
    When I fill in "merge_with" with 1
    And I press "Merge"
  	And I follow "Articles"
  	And I follow "test2"
    Then I should see "test"
    Then I should see "test2"
  Scenario: A non-admin cannot merge two articles
  	Given the blog is set up
  	And I am logged in as a non-admin
 	  And I follow "All Articles"
 	  And I follow "Hello World!"
 	  Then I should not see "Merge"