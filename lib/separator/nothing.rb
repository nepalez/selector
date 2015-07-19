# encoding: utf-8

module Separator

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
    #   condition = Separator::Nothing.instance # singleton
    #   condition[:foo] # => false
    #
    # @param (see Separator::Condition#[])
    #
    # @return [false]
    #
    def [](_value)
      false
    end

  end # class Nothing

end # module Separator
