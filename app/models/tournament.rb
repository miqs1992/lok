# frozen_string_literal: true

class Tournament < ApplicationRecord
  validates :name, :start_date, :tournament_type, presence: true

  enum tournament_type: { league: 'league', contest: 'contest' }

  has_many :teams, dependent: :delete_all
end
