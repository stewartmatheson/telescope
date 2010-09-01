module SearchSetsHelper
  def page_links(search_set, current_page)
    output = last_link(search_set, current_page.to_i)
    (page_count search_set).times do |page_number|
      page_number += 1
      if current_page.to_i != page_number
        output += link_to(page_number, "/search_sets/#{search_set.id}?page=#{page_number}")
      else
        output += "#{page_number}"
      end
    end
    output += next_link(search_set, current_page.to_i)
    raw output
  end
  
  def page_count(search_set)
    pages = search_set.topics.total_entries / 20
    pages += 1 if (search_set.topics.total_entries % 20) > 0
    pages
  end
  
  def last_link(search_set, page_number)
    return link_to("<<", "/search_sets/#{search_set.id}?page=#{page_number - 1}") if page_number > 1
    ""
  end
  
  def next_link(search_set, page_number)
    return link_to(">>", "/search_sets/#{search_set.id}?page=#{page_number + 1}") if page_number < page_count(search_set)
    ""
  end
end
