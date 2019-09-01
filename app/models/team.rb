# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, uniqueness: { scope: :tournament }, presence: true

  belongs_to :tournament
  has_many :players, dependent: :destroy
  has_many :shields, through: :players
  accepts_nested_attributes_for :players, allow_destroy: true

  scope :by_points, lambda {
    all.sort_by(&:points).reverse
  }

  def points
    shields.best_3.sum(:points)
  end
end
