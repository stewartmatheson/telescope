class Post < ActiveRecord::Base
  has_many :replies, :class_name => "Post", :foreign_key => "topic_id"
  belongs_to :topic, :class_name => "Post", :foreign_key => "topic_id"
  belongs_to :user
  validates_presence_of :title, :on => :create, :message => "Can't have a post with out a title"
  validates_presence_of :body, :on => :create, :message => "Can't have an empty body"

  
  define_index do
    indexes title
    indexes body
    indexes created_at, :sortable => true
    set_property :delta => true
  end
  
  def author_name
    if user
      return user.name
    end
    "Anonymous"
  end
  
  def has_permissions?
    false
  end
  
  def is_topic?
    !topic
  end
  
end