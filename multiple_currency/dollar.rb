# frozen_string_literal: true

require_relative 'money'

class Dollar < Money
  def initialize(amount)
    super(amount, 'USD')
  end
end
