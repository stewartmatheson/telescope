namespace :populate do
  desc "Add posts to database"
  task :posts => :environment do
    1000.times do
      Factory.create :post
    end
  end
end