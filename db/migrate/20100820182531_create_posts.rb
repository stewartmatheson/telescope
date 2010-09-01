class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :topic_id, :null => true
      t.integer :user_id, :null => true
      t.boolean :delta, :default => true, :null => false
      
      t.string :user_ip, :null => false
      t.string :user_agent, :null => false
      t.string :user_referrer, :null => false
      t.boolean :approved, :null => false, :default => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
