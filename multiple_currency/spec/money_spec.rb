# frozen_string_literal: true

require_relative './../bank'
require_relative './../money'
require_relative './../expressions/sum'

describe 'Money' do
  describe '足し算' do
    it '5ドル + 5ドル = 10ドル' do
      bank = Bank.new

      five = Money.dollar(5)
      sum = Sum.new(five, five)

      bank.reduce(sum, 'USD')
      expect(bank.reduce(sum, 'USD').equal(Money.dollar(10))).to be_truthy
    end

    it 'returns Sum' do
      five = Money.dollar(5)
      sum = Sum.new(five, five)

      expect(five.equal(sum.add)).to be_truthy
      expect(five.equal(sum.added)).to be_truthy
    end
  end

  describe '掛け算' do
    it '5ドル * 2 = 10ドル' do
      five = Money.dollar(5)
      product = five.times(2)
      expect(product.equal(Money.dollar(10))).to be_truthy
    end
  end

  describe '等価性' do
    it '5ドル = 5ドル' do
      expect(Money.dollar(5).equal(Money.dollar(5))).to be_truthy
    end

    it '5ドル != 6ドル' do
      expect(Money.dollar(5).equal(Money.dollar(6))).to be_falsey
    end

    it '5ドル != 5' do
      expect(Money.dollar(5).equal(5)).to be_falsey
    end

    it '5ドル = 6フランク' do
      expect(Money.dollar(5).equal(Money.franc(5))).to be_falsey
    end
  end

  describe '通貨' do
    it 'ドルの単位はUSD'do
      expect(Money.dollar(5).currency).to eq('USD')
    end
  end
end
