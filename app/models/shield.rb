# frozen_string_literal: true

class Shield < ApplicationRecord
  belongs_to :player
  before_save :calculate_points
  validate :shots_limit

  private

  def calculate_points
    self.points = (1..10).map do |i|
      public_send("p#{i}".to_sym) * i
    end.sum

    self.binary_points = (0..9).map do |i|
      public_send("p#{i + 1}".to_sym) * 10**i
    end.sum
  end

  def shots_limit
    shots = (1..10).map { |i| public_send("p#{i}".to_sym) }.sum
    return if shots <= 10

    errors.add(:base, "Shield can't have more than 10 shots")
  end
end
