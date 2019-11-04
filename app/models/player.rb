# frozen_string_literal: true

class Player < ApplicationRecord
  include Calculable

  belongs_to :team
  delegate :name, to: :team, prefix: true
  delegate :tournament, to: :team
  has_many :shields, dependent: :delete_all
  accepts_nested_attributes_for :shields, allow_destroy: true

  validate :players_limit
  validates :name, presence: true

  scope :individual_classification, lambda {
    joins(:shields)
      .includes(:shields)
      .order(points: :desc, binary_points: :desc)
      .merge(Shield.order(points: :desc))
  }

  def players_limit
    return if team.players.count < (id ? 4 : 3)

    errors.add(:name, I18n.t('activerecord.errors.players_limit'))
  end

  def self.to_csv
    CSV.generate(headers: false) do |csv|
      all.each_with_index do |player, index|
        player.shields.each do |shield|
          shield_points = (1..10).map { |i| shield.public_send("p#{i}") }
          csv << [
            index + 1, player.name, player.team_name, *shield_points, shield.points, player.points
          ]
        end
      end
    end
  end
end
