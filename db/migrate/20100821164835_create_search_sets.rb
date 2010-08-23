class CreateSearchSets < ActiveRecord::Migration
  def self.up
    create_table :search_sets do |t|
      t.integer :user_id
      t.string :search_query_string

      t.timestamps
    end
  end

  def self.down
    drop_table :search_sets
  end
end
