# encoding: utf-8

module Selector

  # The condition checks if the function returns truthy result for a value
  #
  # @example (see #[])
  #
  class Function < Condition

    # Initializes the condition with a function
    #
    # @param [#call] function
    #
    def initialize(_)
      super
    end

    # Checks if the function returns truthy for value
    #
    # @example
    #   condition = Selector::Function.new -> v { v[/foo/] }
    #   condition[:foo] # => true
    #   condition[:bar] # => false
    #
    # @param (see Selector::Condition#[])
    #
    # @return (see Selector::Condition#[])
    #
    def [](value)
      attribute.call(value) ? true : false
    end

  end # class Function

end # module Selector
