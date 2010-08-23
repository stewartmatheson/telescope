class Post < ActiveRecord::Base
  has_many :replies, :class_name => "Post", :foreign_key => "topic_id"
  belongs_to :topic, :class_name => "Post", :foreign_key => "topic_id"
  validates_presence_of :title, :on => :create, :message => "Can't have a post with out a title"
  validates_presence_of :body, :on => :create, :message => "Can't not have an empty post"
  
  define_index do
    indexes body
    indexes title
    set_property :delta => true
  end
end