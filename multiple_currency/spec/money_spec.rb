# frozen_string_literal: true

require_relative './../dollar'

RSpec.describe 'Dollar' do
  it do
    five = Dollar.new(5)
    five.times(2)
    expect(five.amount).to eq(10)
  end
end
