class User < ActiveRecord::Base
  has_many :search_sets, :class_name => "SearchSet", :foreign_key => "user_id"
  has_many :posts, :class_name => "Post", :foreign_key => "user_id"
  validates_presence_of :name, :on => :create, :message => "Must have a user name"
  validates_uniqueness_of :name, :on => :create, :message => "There is already a user with this name"
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  after_create :create_default_telescopes
  
  private 
  
  def create_default_telescopes
    SearchSet.default_sets.each do |s|
      t = s.clone
      t.user = self
      t.save
    end
  end
end
