# encoding: utf-8

module Separator

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
    #   condition = Separator::Function.new -> v { v[/foo/] }
    #   condition[:foo] # => true
    #   condition[:bar] # => false
    #
    # @param (see Separator::Condition#[])
    #
    # @return (see Separator::Condition#[])
    #
    def [](value)
      nil ^ attribute.call(value)
    end

  end # class Function

end # module Separator
