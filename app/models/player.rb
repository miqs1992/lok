# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team
  has_many :shields, dependent: :delete_all
end
