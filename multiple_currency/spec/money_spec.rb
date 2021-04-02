# frozen_string_literal: true

require_relative './../money'

describe 'Money' do
  describe 'times' do
    it '5ドル * 2 = 10ドル' do
      five = Money.dollar(5)
      product = five.times(2)
      expect(product.equal(Money.dollar(10))).to be_truthy
    end
  end

  describe 'equals' do
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

  describe 'currency' do
    it do
      expect(Money.dollar(5).currency).to eq('USD')
    end
  end
end
