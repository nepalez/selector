# encoding: utf-8

module Selector

  # The condition that accepts any value
  #
  # @example (see #[])
  #
  class Nothing < Condition

    include Singleton

    # @!method [](value)
    # Returns false
    #
    # @example
    #   condition = Selector::Nothing.instance # singleton
    #   condition[:foo] # => false
    #
    # @param (see Selector::Condition#[])
    #
    # @return [false]
    #
    def [](_value)
      false
    end

  end # class Nothing

end # module Selector
