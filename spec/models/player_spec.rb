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
end
