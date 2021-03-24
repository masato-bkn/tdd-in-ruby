# frozen_string_literal: true

require_relative 'money'

class Dollar < Money
  def initialize(amount)
    super(amount, 'USD')
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end
end
