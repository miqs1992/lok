# frozen_string_literal: true

FactoryBot.define do
  factory :shield do
    player

    factory :shield_with_shots do
      p1 { Faker::Number.between(from: 0, to: 10) }
      p2 { Faker::Number.between(from: 0, to: 10) }
      p3 { Faker::Number.between(from: 0, to: 10) }
      p4 { Faker::Number.between(from: 0, to: 10) }
      p5 { Faker::Number.between(from: 0, to: 10) }
      p6 { Faker::Number.between(from: 0, to: 10) }
      p7 { Faker::Number.between(from: 0, to: 10) }
      p8 { Faker::Number.between(from: 0, to: 10) }
      p9 { Faker::Number.between(from: 0, to: 10) }
      p10 { Faker::Number.between(from: 0, to: 10) }
    end
  end
end
