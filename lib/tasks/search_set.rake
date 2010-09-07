namespace :telescope do
  desc "Create a default telescope for basic users."
  task :create => :environment do
    print "Enter telescope query string: "
    query = STDIN.gets.chomp
    if SearchSet.create(:search_query_string => query)
      puts "Search set created"
    end
  end
end