class SearchSet < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates_presence_of :search_query_string, :on => :create, :message => "Can't have an empty search"
  
  def posts
    Post.search search_query_string
  end
  
  def topics
    topic_list = []
    posts.each do |post|
      if post.is_topic?
        topic_list << post if !topic_list.detect { |t| t == post }
      else
        topic_list << post.topic if !topic_list.detect { |t| t == post.topic }
      end
    end
    topic_list
  end
  
end