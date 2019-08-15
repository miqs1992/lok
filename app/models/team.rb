# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :tournament
  has_many :players, dependent: :delete_all
end
