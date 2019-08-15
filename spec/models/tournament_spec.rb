# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tournament, type: :model do
  it 'has valid factory' do
    expect(create(:tournament)).to be_valid
  end
end
