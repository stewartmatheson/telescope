class SearchSet < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates_presence_of :search_query_string, :on => :create, :message => "Can't have an empty search"
  
  def topics(options = {})
    return Post.latest_first.search search_query_string if options.empty?
    Post.latest_first.search search_query_string, options
  end
  
end