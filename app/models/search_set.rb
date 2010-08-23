class SearchSet < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates_presence_of :search_query_string, :on => :create, :message => "Can't have an empty search"
  
  def posts
    Post.search search_query_string
  end
end
