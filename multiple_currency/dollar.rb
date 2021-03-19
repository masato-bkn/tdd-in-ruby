# frozen_string_literal: true

class Dollar
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end

  def equal(money)
    return false unless money.instance_of?(Dollar)
    amount == money.amount
  end
end
