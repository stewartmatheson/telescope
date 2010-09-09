class SearchSet < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates_presence_of :search_query_string, :on => :create, :message => "Can't have an empty search"
  
  def topics(options = {})
    default_options = { :match_mode => :extended }
    options.merge!(default_options)
    puts options.inspect
    Post.latest_first.search search_query_string, options
  end
  
  def query_string_no_prefix
    search_query_string.gsub(/(\[\w*\])/, "").strip
  end
  
  def prefixes
    return_prefixes = Array.new
    search_query_string.scan(/(\[\w*\])/).each do |p|
      return_prefixes << p.first.gsub(/\[|\]/, "")
    end
    return_prefixes
  end

end