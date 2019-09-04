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
        expect(shield.binary_points).to eq(5_410_000_000)
      end
    end

    describe 'after save' do
      it 'calculates player points' do
        expect(shield.player.points).to eq(94)
      end

      it 'calculates team points' do
        expect(shield.team.points).to eq(94)
      end
    end
  end

  describe 'with_row_number' do
    subject(:shield) { create(:shield, p10: 5, p9: 4, p8: 1) }

    it 'assigns rank' do
      expect(shield.player.shields.with_row_number.first.row_number).to eq(1)
    end
  end

  describe 'validations' do
    describe 'shots limit' do
      subject(:shield) { build(:shield, p10: shot_count) }

      let(:shot_count) { 10 }

      context 'when shot count is 10 or less' do
        it { is_expected.to be_valid }
      end

      context 'when shot count is more than 10' do
        let(:shot_count) { 11 }

        it { is_expected.not_to be_valid }
      end
    end

    describe 'shields limit' do
      let(:player) { create(:player) }
      subject(:shield) { build(:shield, player: player) }

      context 'when tournament is league' do
        before do
          player.tournament.league!
          create_list(:shield, 4, player: player)
        end

        it { is_expected.not_to be_valid }
      end

      context 'when tournament is single' do
        before do
          player.tournament.single!
          create(:shield, player: player)
        end

        it { is_expected.not_to be_valid }
      end
    end
  end
end
