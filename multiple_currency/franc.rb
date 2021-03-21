# frozen_string_literal: true

class Franc
  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Franc.new(@amount * multiplier)
  end

  def equal(money)
    self.class.attr_accessor :amount

    return false unless money.instance_of?(Franc)

    amount == money.amount
  end
end
