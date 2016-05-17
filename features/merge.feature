Feature: Merge Articles
  As a blog administrator
  In order to consolidate similar topics and views
  I want to be able to merge similar articles

Background: articles to be merged

  Scenario: An admin should be able to merge articles
  	Given the blog is set up
  	And I am logged into the admin panel
  	And I follow "New Article"
  	And I fill in "article_title" with "Article 1"
  	And I fill in "article__body_and_extended_editor" with "yayayayayaya"
  	And I press "Publish"
  	Then I should see "Manage articles"
  	And I should be on the admin content page
  	And I follow "New Article"
  	And I fill in "article_title" with "Article"
  	And I fill in "article__body_and_extended_editor" with "yayayayayaya"
  	And I press "Publish"
  	And I follow "Article 1"
  	Then I should see "Merge"
  	And I fill in "merge_with" with "4"
  	And I press "Merge"
  Scenario: A non-admin should not be able to merge articles
  	Given the blog is set up
  	And I am logged into the non-admin panel
  	And I follow "New Article"
    Then I should not see "Merge"