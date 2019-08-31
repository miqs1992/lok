# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name { Faker::Sports::Football.unique.player }
    team
  end
end
