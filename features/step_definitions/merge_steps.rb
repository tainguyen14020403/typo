And /^Article "(.*)" with id "(.*)" body "(.*)" exists$/ do |title, id , body|
  Article.create(:allow_comments => true,
                 :allow_pings => true,
                 :author => "admin",
                 :body => body,
                 :id => id,
                 :published => true,
                 :state => "published",
                 :title => title,
                 :type => "Article",
                 :user_id => 3)
end
    