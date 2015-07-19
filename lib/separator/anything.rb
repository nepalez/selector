# encoding: utf-8

module Separator

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
    #   condition = Separator::Anything.instance # singleton
    #   condition[:foo] # => true
    #
    # @param (see Separator::Condition#[])
    #
    # @return [true]
    #
    def [](_value)
      true
    end

  end # class Anything

end # module Separator
