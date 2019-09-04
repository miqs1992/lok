# frozen_string_literal: true

module Calculable
  extend ActiveSupport::Concern

  included do
    scope :by_points, lambda {
      order(points: :desc, binary_points: :desc)
    }

    def calculate_points
      update(
          points: shields.best_3.sum(:points),
          binary_points: shields.best_3.sum(:binary_points)
      )
    end
  end
end
