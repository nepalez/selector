# encoding: utf-8

module Selector

  # The condition that accepts any value
  #
  # @example (see #[])
  #
  class Anything < Condition

    include Singleton

    # @!method [](value)
    # Returns true
    #
    # @example
    #   condition = Selector::Anything.instance # singleton
    #   condition[:foo] # => true
    #
    # @param (see Selector::Condition#[])
    #
    # @return [true]
    #
    def [](_value)
      true
    end

  end # class Anything

end # module Selector
