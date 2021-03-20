# frozen_string_literal: true

require_relative './../dollar'

RSpec.describe 'Dollar' do
  it '正しく計算できること' do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product.equal(Dollar.new(10))).to be_truthy

    product = five.times(3)
    expect(product.equal(Dollar.new(15))).to be_truthy
  end

  it '比較できること' do
    expect(Dollar.new(5).equal(Dollar.new(5))).to be_truthy
    expect(Dollar.new(5).equal(Dollar.new(6))).to be_falsey
    expect(Dollar.new(5).equal(5)).to be_falsey
  end
end
