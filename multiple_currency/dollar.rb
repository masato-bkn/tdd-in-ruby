# frozen_string_literal: true

class Dollar
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(_multiplier)
    @amount *= 2
  end
end
