# frozen_string_literal: true

require_relative './../dollar'
require_relative './../franc'

RSpec.describe 'Dollar' do
  it '正しく計算できること' do
    five = Money.dollar(5)
    product = five.times(2)
    expect(product.equal(Money.dollar(10))).to be_truthy

    product = five.times(3)
    expect(product.equal(Money.dollar(15))).to be_truthy
  end

  it '比較できること' do
    expect(Money.dollar(5).equal(Money.dollar(5))).to be_truthy
    expect(Money.dollar(5).equal(Money.dollar(6))).to be_falsey
    expect(Money.dollar(5).equal(5)).to be_falsey
  end

  it do
    expect(Money.dollar(5).equal(Money.franc(5))).to be_falsey
  end

  it do
    expect(Money.dollar(5).currency).to eq('USD')
  end
end
