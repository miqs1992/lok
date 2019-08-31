# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, uniqueness: { scope: :tournament }, presence: true

  belongs_to :tournament
  has_many :players, dependent: :destroy
  accepts_nested_attributes_for :players, allow_destroy: true

  scope :with_points, lambda {
    includes(:players)
      .left_joins(players: :shields)
      .select('teams.*, coalesce(sum(shields.points),0) as team_points')
      .group(:id)
  }
end
