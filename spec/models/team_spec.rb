# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'has valid factory' do
    expect(create(:team)).to be_valid
  end

  describe ':team_with_players' do
    subject(:team) { create(:team_with_players) }

    it { is_expected.to be_valid }

    it 'creates 3 players' do
      expect(team.players.unscoped.count).to eq(3)
    end
  end

  describe '.points' do
    subject(:team) { create(:team_with_players) }

    before do
      team.tournament.league!
      team.players.each do |player|
        create_list(:shield, 4, p10: 10, player: player)
      end
    end

    it 'takes only 3 best shields' do
      expect(team.points).to eq(900)
    end
  end
end
