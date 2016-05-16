Feature: Access to Merge Articles
  As a blog administrator
  In order to limit access to articles
  I want to be able to merge articles

Background: articles to be merged

  Scenario: An admin should be able to see the merge button
  	Given the blog is set up
  	And I am logged into the admin panel
  	And I follow "New Article"
  	And I fill in "article_title" with "Article 1"
  	And I fill in "article__body_and_extended_editor" with "aad"
  	And I press "Publish"
  	Then I should see "Manage articles"
  
  Scenario: A non-admin cannot merge two articles
  	Given the blog is set up
  	And I am logged in as a non-admin
 	  And I follow "All Articles"
 	  And I follow "Hello World!"
 	  Then I should not see "Merge Articles"