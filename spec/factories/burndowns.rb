FactoryGirl.define do
  factory :burndown do
    date "2015-07-04"
    unstarted 1
    started 1
    finished 1
    delivered 1
    accepted "MyString"
  end
end
