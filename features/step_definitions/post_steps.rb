

Given /^I have posts titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Factory.create(:post, :title => title)
  end
end


Then /^the post with id = (\d+) should have (\d+) replies$/ do |id, reply_count|
  p = Post.find(id)
  p.replies.count.should == reply_count.to_i
end


Then /^the post with id = (\d+) should have a topic with id = (\d+)$/ do |post_id, topic_id|
  p = Post.find(post_id)
  p.topic.id.should == topic_id.to_i
end

Given /^I am using FireFox$/ do
  add_headers "HTTP_USER_AGENT" => "Mozilla/5.0 (Windows; U; Windows NT 6.1; ru; rv:1.9.2.3) Gecko/20100401 Firefox/4.0 (.NET CLR 3.5.30729)"
end

When /^I click button "([^"]*)"$/ do |button_name|
  click_button button_name
end

Then /^The post "([^"]*)" should have a prefix count of (\d+)$/ do |post_title, prefix_count|
  current_post = Post.find_by_title(post_title)
  current_post.prefixes.count.should == prefix_count.to_i
end

Then /^The post "([^"]*)" should have a title with out the prefix of "([^"]*)"$/ do |post_title, title_with_out_prefix|
  current_post = Post.find_by_title(post_title)
  current_post.title_no_prefix.should == title_with_out_prefix
end
