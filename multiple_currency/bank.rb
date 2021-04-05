# frozen_string_literal: true

require_relative './money'

class Bank
  def reduce(source, to)
    source.reduce(to)
  end

  def money_factory(amount, to)
    case to
    when 'USD' then Money.dollar(amount)
    when 'CHF' then Money.franc(amount)
    end
  end
end
