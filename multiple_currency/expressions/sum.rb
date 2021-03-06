# frozen_string_literal: true

class Sum
  attr_reader :add, :added

  def initialize(add, added)
    validate_initializer(add, added)

    @add = add
    @added = added
  end

  def reduce(to)
    Money.new(@add.amount + @added.amount, to)
  end

  private

  def validate_initializer(add, added)
    raise ArgumentError if !add.instance_of?(Money) || !added.instance_of?(Money)
  end
end
