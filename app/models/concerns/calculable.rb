# frozen_string_literal: true

module Calculable
  extend ActiveSupport::Concern

  included do
    def calculate_points
      update(
        points: shields.best_3.sum(:points),
        binary_points: shields.best_3.sum(:binary_points)
      )
    end
  end
end
