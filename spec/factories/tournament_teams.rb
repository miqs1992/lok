# frozen_string_literal: true

FactoryBot.define do
  factory :tournament_team do
    team
    tournament
  end
end
