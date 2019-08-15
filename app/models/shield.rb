# frozen_string_literal: true

class Shield < ApplicationRecord
  belongs_to :player
  before_save :calculate_points

  def calculate_points
    self.points = (1..10).map do |i|
      public_send("p#{i}".to_sym) * i
    end.sum

    self.binary_points = (0..9).map do |i|
      public_send("p#{i + 1}".to_sym) * 10**i
    end.sum
  end
end
