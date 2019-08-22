# frozen_string_literal: true

class Tournament < ApplicationRecord
  validates :name, :start_date, :tournament_type, presence: true
  validates :name, uniqueness: true

  has_many :tournament_teams, dependent: :delete_all
  has_many :teams, through: :tournament_teams
  has_many :players, through: :teams

  enum tournament_type: { league: 'league', contest: 'contest' }
end
