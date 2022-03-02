FactoryBot.define do
  factory :comment do
    score { "5" }
    text { Faker::Lorem.sentence }
    association :user 
    association :spot
  end
end
