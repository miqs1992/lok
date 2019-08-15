# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  it 'has valid factory' do
    expect(create(:player)).to be_valid
  end
end
