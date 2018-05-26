FactoryBot.define do
  factory :setting do
    unstarted_color { Faker::Color.hex_color }
    started_color   { Faker::Color.hex_color }
    finished_color  { Faker::Color.hex_color }
    delivered_color { Faker::Color.hex_color }
    impeded_color   { Faker::Color.hex_color }
    accepted_color  { Faker::Color.hex_color }
    feature_color   { Faker::Color.hex_color }
    chore_color     { Faker::Color.hex_color }
    bug_color       { Faker::Color.hex_color }
    retro_color     { Faker::Color.hex_color }
    interval        { Faker::Number.number(2) }
  end
end
