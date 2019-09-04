# frozen_string_literal: true

class Player < ApplicationRecord
  include Calculable

  belongs_to :team
  has_many :shields, dependent: :delete_all
  accepts_nested_attributes_for :shields, allow_destroy: true
  validate :players_limit, on: :create

  delegate :tournament, to: :team

  def players_limit
    return if team.players.unscoped.count < 3

    errors.add(:name, "Team can't have more than 3 players")
  end
end
