# frozen_string_literal: true

require_relative './../dollar'

RSpec.describe 'Dollar' do
  it '正しく計算できること' do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to eq(10)

    product = five.times(3)
    expect(product.amount).to eq(15)
  end

  it '比較できること' do
    expect(Dollar.new(5).equal(Dollar.new(5))).to be_truthy
    expect(Dollar.new(5).equal(Dollar.new(6))).to be_falsey
    expect(Dollar.new(5).equal(5)).to be_falsey
  end
end
