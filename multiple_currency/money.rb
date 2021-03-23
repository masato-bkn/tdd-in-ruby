# frozen_string_literal: true

require_relative 'dollar'

class Money
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def equal(money)
    return false unless money.is_a?(Money)

    amount == money.amount && money.instance_of?(self.class)
  end

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end
end
