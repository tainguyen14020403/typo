And /^Article "(.*)" with id "(.*)" body "(.*)" exists$/ do |title, id , body|
  Article.create(:allow_comments => true,
                 :allow_pings => true,
                 :author => "admin",
                 :body => body,
                 :id => id,
                 :published => true,
                 :state => "published",
                 :title => title,
                 :type => "Article")
end

And /^I log out$/ do
    visit "/accounts/logout"
end
And /^I should not see admin in author$/ do
  within('td') do
    page.should have_no_content "admin"
  end
end

When /^I click "(.*?)"$/ do |arg1|
  find_link(arg1).click
end

When /^I comment "(.*?)" with "(.*?)" by "(.*?)"$/ do |arg1, arg2, arg3|
  find_link(arg1).click
  fill_in 'comment_author', :with => arg3
  fill_in "comment_body", :with => arg2
  click_button("form-submit-button")
end

And /^I visit admin page$/ do
    visit root_path
    visit "/admin"
end

Then /^page should have "(.*?)"$/ do |a|
    page.should have_content(a)
end