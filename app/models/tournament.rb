# frozen_string_literal: true

class Tournament < ApplicationRecord
  validates :name, :start_date, :tournament_type, presence: true
  validates :name, uniqueness: true

  has_many :teams, dependent: :delete_all
  accepts_nested_attributes_for :teams, allow_destroy: true

  enum tournament_type: { league: 'league', contest: 'contest' }
end
