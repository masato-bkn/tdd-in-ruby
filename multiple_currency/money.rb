# frozen_string_literal: true

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
    case currency
    when 'USD' then Money.dollar(@amount * multiplier)
    when 'CHF' then Money.franc(@amount * multiplier)
    end
  end

  def equal(money)
    return false unless money.is_a?(Money)

    currency == money.currency && amount == money.amount
  end
end
