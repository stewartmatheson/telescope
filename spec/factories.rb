Factory.define :post do |p|
  p.title { Faker::Lorem.sentence }
  p.body  { Faker::Lorem.paragraphs 10 }
end