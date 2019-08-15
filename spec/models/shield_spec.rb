# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shield, type: :model do
  it 'has valid factory' do
    expect(create(:shield)).to be_valid
  end

  describe 'calculations' do
    subject(:shield) { create(:shield, p10: 5, p9: 4, p8: 1) }

    describe '.calculate_points' do
      it 'calculates points after save' do
        expect(shield.points).to eq(94)
      end
    end

    describe '.calculate_binary_points' do
      it 'calculates binary points after save' do
        expect(shield.binary_points).to eq(5410000000)
      end
    end
  end
end
