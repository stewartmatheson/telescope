When /^The search index is rebuilt$/ do
  ThinkingSphinx::Test.index
  sleep(0.25)
end
