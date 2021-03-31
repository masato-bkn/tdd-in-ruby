# frozen_string_literal: true

require_relative 'money'

class Franc < Money
  def initialize(amount)
    super(amount, 'CHF')
  end
end
