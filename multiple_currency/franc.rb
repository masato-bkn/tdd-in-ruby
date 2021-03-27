# frozen_string_literal: true

require_relative 'money'

class Franc < Money
  def initialize(amount)
    super(amount, 'CHF')
  end

  def times(multiplier)
    Franc.new(@amount * multiplier)
  end
end
