FactoryBot.define do
  factory :spot do
    name { '細江公園' }
    score { '5' }
    text { Faker::Lorem.sentence }
    genre_id { Genre.all.sample }
    time_required_id { TimeRequired.all.sample }
    situation_id { Situation.all.sample }
    direction { Direction.all.sample }

    after(:build) do |spot|
      spot.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end