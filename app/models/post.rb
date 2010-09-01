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
    indexes replies.body, :as => :post_replies_body
    indexes replies.title, :as => :post_replies_title
    set_property :delta => true
    where "posts.topic_id IS NULL"
  end
  
  sphinx_scope(:latest_first) do
    { :order => 'created_at ASC, @relevance DESC' }
  end
  
  def author_name
    return user.name if user
    "Anonymous"
  end
  
  def has_permissions?(current_user)
    current_user == user
  end
  
  def is_topic?
    !topic
  end
  
  def request=(request)
    self.user_ip    = request.remote_ip
    self.user_agent = request.env['HTTP_USER_AGENT']
    self.referrer   = request.env['HTTP_REFERER']
  end
end