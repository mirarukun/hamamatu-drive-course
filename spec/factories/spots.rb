FactoryBot.define do
  factory :spot do
    name { '細江公園' }
    score { '5' }
    text { Faker::Lorem.sentence }
    genre_id { Genre.all.sample.id }
    time_required_id { TimeRequired.all.sample.id }
    situation_id { Situation.all.sample.id }
    direction_id { Direction.all.sample.id }
    association :user 

    after(:build) do |spot|
      spot.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
