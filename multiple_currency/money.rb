# frozen_string_literal: true

require_relative './expressions/sum'

class Money
  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  class << self
    def dollar(amount)
      Money.new(amount, 'USD')
    end

    def franc(amount)
      Money.new(amount, 'CHF')
    end
  end

  def times(multiplier)
    money_factory(@amount * multiplier, currency)
  end

  def add(added)
    sum = Sum.new(self, added)
    amount = sum.excute

    money_factory(amount, currency)
  end

  def equal(money)
    return false unless money.is_a?(Money)

    currency == money.currency && amount == money.amount
  end

  private

  def money_factory(amount, currency)
    case currency
    when 'USD' then Money.dollar(amount)
    when 'CHF' then Money.franc(amount)
    end
  end
end
