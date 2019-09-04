# frozen_string_literal: true

class Tournament < ApplicationRecord
  validates :name, :start_date, :tournament_type, presence: true
  validates :name, uniqueness: true

  has_many :teams, dependent: :destroy
  has_many :players, through: :teams
  has_many :shields, through: :players

  enum tournament_type: { league: 'league', single: 'single' }
end
