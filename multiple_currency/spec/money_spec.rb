# frozen_string_literal: true

require_relative './../dollar'
require_relative './../franc'

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

  it do
    expect(Dollar.new(5).equal(Franc.new(5))).to be_falsey
  end
end

RSpec.describe 'Franc' do
  it '正しく計算できること' do
    five = Franc.new(5)
    product = five.times(2)
    expect(product.equal(Franc.new(10))).to be_truthy

    product = five.times(3)
    expect(product.equal(Franc.new(15))).to be_truthy
  end

  it '比較できること' do
    expect(Franc.new(5).equal(Franc.new(5))).to be_truthy
    expect(Franc.new(5).equal(Franc.new(6))).to be_falsey
    expect(Franc.new(5).equal(5)).to be_falsey
  end

  it do
    expect(Dollar.new(5).equal(Franc.new(5))).to be_falsey
  end
end
