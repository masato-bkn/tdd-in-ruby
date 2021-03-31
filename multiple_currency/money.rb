# frozen_string_literal: true

require_relative 'dollar'

class Money
  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def equal(money)
    return false unless money.is_a?(Money)

    currency == money.currency && amount == money.amount
  end

  def times(multiplier)
    case currency
    when 'USD' then Money.dollar(@amount * multiplier)
    when 'CHF' then Money.franc(@amount * multiplier)
    end
  end

  def self.dollar(amount)
    Money.new(amount, 'USD')
  end

  def self.franc(amount)
    Money.new(amount, 'CHF')
  end
end
