# frozen_string_literal: true

require_relative './../bank'
require_relative './../money'
require_relative './../pair'
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

  describe '変換' do
    xit do
      bank = Bank.new
      bank.add_rate('CHF', 'USD', 2)
      result_money = bank.reduce(Money.franc(2), 'USD')
      exoect(result_money.equals(Money.dollar(1))).to be_truthy
    end
  end

  describe '通貨' do
    it 'ドルの単位はUSD' do
      expect(Money.dollar(5).currency).to eq('USD')
    end
  end
end

describe 'Pair' do
  let :pair do
    Pair.new('USD', 'CHF', 2)
  end

  it do
    expect(pair.from).to eq('USD')
  end

  it do
    expect(pair.to).to eq('CHF')
  end

  it do
    expect(pair.rate).to eq(2)
  end
end

describe 'Bank' do
  let :bank do
    Bank.new
  end

  it '為替ペア、レートの追加' do
    bank.add_rate('USD', 'CHF', 1)

    pair = bank.pairs[0]
    expect(pair.from).to eq('USD')
    expect(pair.to).to eq('CHF')
    expect(pair.rate).to eq(1)
  end

  it '為替ペア、レートと同じ組み合わせを追加' do
    bank.add_rate('USD', 'CHF', 1)
    bank.add_rate('USD', 'CHF', 1)

    expect(bank.pairs.count).to eq(1)
  end
end
