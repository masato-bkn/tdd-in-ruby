# frozen_string_literal: true

require_relative './money'
require_relative './pair'

class Bank
  attr_reader :pairs

  def initialize
    @pairs = []
  end

  def reduce(source, to)
    source.reduce(to)
  end

  def add_rate(from, to, rate)
    return if @pairs.select { |pair| pair.from == from && pair.to == to && pair.rate && rate }.count >= 1

    @pairs << Pair.new(from, to, rate)
  end

  def money_factory(amount, to)
    case to
    when 'USD' then Money.dollar(amount)
    when 'CHF' then Money.franc(amount)
    end
  end
end
