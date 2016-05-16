Feature: Merge Articles
  As a blog administrator
  In order to consolidate similar topics and views
  I want to be able to merge similar articles

Background: articles to be merged

	Given the following articles exist:
	| title                   |
  	| Article 1               |
  	| Article 2               | 

  Scenario: An admin should be able to merge articles
  	Given the blog is set up
  	And I am logged into the admin panel
  	And I follow "All Articles"
  	Then I should see "Manage articles"
  	And I should be on the admin content page
  	And I follow "New Article"
    Then I should see "Merge"
  Scenario: A non-admin should not be able to merge articles
  	Given the blog is set up
  	And I am logged into the non-admin panel
  	And I follow "New Article"
    Then I should not see "Merge"