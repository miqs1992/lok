# frozen_string_literal: true

class Team < ApplicationRecord
  include Calculable

  validates :name, uniqueness: { scope: :tournament }, presence: true

  belongs_to :tournament
  has_many :players, dependent: :destroy
  has_many :shields, through: :players
  accepts_nested_attributes_for :players, allow_destroy: true

  scope :ranked, lambda {
    from <<-SQL.strip_heredoc
      (SELECT *, rank() OVER (PARTITION BY tournament_id ORDER BY points DESC, binary_points DESC) FROM teams) AS teams
    SQL
  }

  def self.to_csv
    attributes = %w[rank name first_player_name second_player_name third_player_name points]

    CSV.generate(headers: false) do |csv|
      csv << attributes

      all.includes(:players).ranked.each do |team|
        csv << attributes.map { |attr| team.public_send(attr) }
      end
    end
  end

  def first_player_name
    players[0]&.name
  end

  def second_player_name
    players[1]&.name
  end

  def third_player_name
    players[2]&.name
  end
end
