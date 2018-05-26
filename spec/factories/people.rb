FactoryBot.define do
  factory :person do
    person_id             { Faker::Number.number(10) }
    name                  { Faker::Name.name }
    email                 { Faker::Internet.email }
    image_path            { Faker::Internet.url }
    password              'password'
    password_confirmation 'password'
  end
end
