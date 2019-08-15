# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team
  has_many :shields, dependent: :delete_all
  accepts_nested_attributes_for :shields, allow_destroy: true

  delegate :tournament, to: :team

  default_scope do
    left_joins(:shields).select('players.*, coalesce(sum(shields.points),0) as points').group(:id)
  end
end
