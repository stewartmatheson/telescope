When /^I rebuild the search index$/ do
  ThinkingSphinx::Test.index 
  sleep(0.25)
end