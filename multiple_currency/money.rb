# frozen_string_literal: true

class Money
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def equal(money)
    return false unless money.is_a?(Money)

    amount == money.amount && money.instance_of?(self.class)
  end
end
