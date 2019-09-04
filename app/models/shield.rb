# frozen_string_literal: true

class Shield < ApplicationRecord
  belongs_to :player
  delegate :team, to: :player

  before_save :calculate_points
  after_save :calculate_player_and_team

  validate :shots_limit
  validate :shields_limit, on: :create

  scope :best_3, lambda {
    with_row_number.where('shields.row_number <= 3')
  }

  def self.with_row_number
    from <<-SQL.strip_heredoc
      (SELECT *, row_number() OVER (PARTITION BY player_id ORDER BY points DESC) FROM shields) AS shields
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

  def calculate_player_and_team
    player.calculate_points
    team.calculate_points
  end

  def shots_limit
    shots = (1..10).map { |i| public_send("p#{i}".to_sym) }.sum
    return if shots <= 10

    errors.add(:p1, I18n.t('activerecord.errors.shots_limit'))
  end

  def shields_limit
    limit = player.tournament.league? ? 4 : 1
    return if player.shields.count < limit

    errors.add(:p1, I18n.t('activerecord.errors.shields_limit', limit: limit))
  end
end
