# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  it 'has valid factory' do
    expect(create(:player)).to be_valid
  end

  describe 'validations' do
    describe 'players limit' do
      let(:team) { create(:team_with_players) }

      it 'is invalid with 4 players' do
        expect(build(:player, team: team)).not_to be_valid
      end
    end
  end

  describe 'points' do
    subject(:player) { create(:player) }

    before do
      player.tournament.league!
      create_list(:shield, 4, p10: 10, player: player)
    end

    it 'takes only 3 best shields' do
      expect(player.points).to eq(300)
    end
  end
end
