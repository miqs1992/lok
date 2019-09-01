# frozen_string_literal: true

class Shield < ApplicationRecord
  belongs_to :player
  before_save :calculate_points
  # after_save :calculate_rank

  validate :shots_limit
  validate :shields_limit, on: :create

  scope :best_3, lambda {
    with_row_number.where('shields.row_number <= 3')
  }

  def self.with_row_number
    from <<-SQL.strip_heredoc
      (SELECT *, row_number() OVER (
      PARTITION BY player_id
      ORDER BY points DESC
      ) FROM shields) AS shields
    SQL
  end

  def calculate_points
    self.points = (1..10).map do |i|
      public_send("p#{i}".to_sym) * i
    end.sum

    self.binary_points = (0..9).map do |i|
      public_send("p#{i + 1}".to_sym) * 10**i
    end.sum
  end

  def shots_limit
    shots = (1..10).map { |i| public_send("p#{i}".to_sym) }.sum
    return if shots <= 10

    errors.add(:p1, "Shield can't have more than 10 shots")
  end

  def shields_limit
    if player.tournament.league?
      return if player.shields.count < 4

      errors.add(:p1, "Player can't have more than 4 shields")
    else
      return if player.shields.count < 1

      errors.add(:p1, "Player can't have more than 1 shield")
    end
  end
end
