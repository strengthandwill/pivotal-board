FactoryBot.define do
  factory :account do
    name { Faker::Lorem.word }
    path { Faker::Lorem.word }
    project_ids { ['1'] }
    owner_image { true }
  end
end
