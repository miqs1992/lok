# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    name { Faker::Sports::Football.team }

    after(:create) do |team|
      create(:tournament).teams << team
    end

    factory :team_with_players do
      after(:create) do |team|
        create_list(:player, 3, team: team)
      end
    end
  end
end
