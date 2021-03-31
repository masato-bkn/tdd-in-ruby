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

    amount == money.amount && money.instance_of?(self.class)
  end

  def times(multiplier)
    case currency
    when 'USD' then Money.dollar(@amount * multiplier)
    when 'CHF' then Money.franc(@amount * multiplier)
    end
  end

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end
end
