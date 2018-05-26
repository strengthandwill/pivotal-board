FactoryBot.define do
  factory :account do
    name         { Faker::Lorem.word }
    path         { Faker::Lorem.word }
    project_name { Faker::Lorem.word }
    project_ids  { Faker::Number.number(10) }
    owner_image  { true }
  end
end
