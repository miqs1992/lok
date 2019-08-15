# frozen_string_literal: true

FactoryBot.define do
  factory :tournament do
    name { Faker::Sports::Football.competition }
    start_date { Time.current }
    type { :league }
  end
end
