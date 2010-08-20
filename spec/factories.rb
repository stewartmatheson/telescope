Factory.define :post do |p|
  p.title { Faker::sentance }
  p.body  { Faker::Lorem.paragraphs 5 }
end