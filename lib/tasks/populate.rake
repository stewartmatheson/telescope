namespace :populate do
  desc "Add posts to database"
  task :posts => :environment do
    100.times do
      Factory.create :post, :topic_id => nil
    end
    
    1000.times do
      Factory.create :post
    end
    
  end
end