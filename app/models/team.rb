# frozen_string_literal: true

class Team < ApplicationRecord
  include Calculable

  validates :name, uniqueness: { scope: :tournament }, presence: true

  belongs_to :tournament
  has_many :players, dependent: :destroy
  has_many :shields, through: :players
  accepts_nested_attributes_for :players, allow_destroy: true
end
