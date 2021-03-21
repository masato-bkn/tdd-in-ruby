# frozen_string_literal: true

class Money
  def initialize(amount)
    @amount = amount
  end

  def equal(money)
    self.class.attr_accessor :amount

    return false unless money.is_a?(Money)

    amount == money.amount
  end
end
