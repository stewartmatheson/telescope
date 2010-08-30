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

When /^I click button "([^"]*)"$/ do |button_name|
  click_button button_name
end
