# frozen_string_literal: true

require_relative 'money'

class Dollar < Money
  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end
end
