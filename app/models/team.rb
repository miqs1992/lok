# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, uniqueness: { scope: :tournament }, presence: true

  belongs_to :tournament
  has_many :players, dependent: :delete_all
  accepts_nested_attributes_for :players, allow_destroy: true
end
