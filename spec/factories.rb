Factory.define :post do |p|
  p.title     { Faker::Lorem.sentence }
  p.body      { Faker::Lorem.paragraphs 10 }
  p.topic_id  { rand(100) }
end