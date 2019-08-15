# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'has valid factory' do
    expect(create(:team)).to be_valid
  end

  describe ':team_with_players' do
    it 'has valid factory' do
      expect(create(:team_with_players)).to be_valid
    end

    it 'creates 3 players' do
      team = create(:team_with_players)
      expect(team.players.count).to eq(3)
    end
  end
end
