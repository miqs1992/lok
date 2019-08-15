# frozen_string_literal: true

class Tournament < ApplicationRecord
  enum type: { league: 'league', contest: 'contest' }

  has_many :teams, dependent: :delete_all
end
