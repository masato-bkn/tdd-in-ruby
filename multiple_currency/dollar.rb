# frozen_string_literal: true

class Dollar
  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end

  def equal(money)
    self.class.attr_accessor :amount

    return false unless money.instance_of?(Dollar)

    amount == money.amount
  end
end
