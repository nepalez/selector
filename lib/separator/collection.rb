# encoding: utf-8

module Separator

  # The condition checks if a value is included to the collection
  #
  # @example (see #[])
  #
  class Collection < Condition

    # @!method initialize(collection)
    # Initializes the condition with a collection of allowed values
    #
    # @param [Enumerable] collection
    #
    def initialize(_)
      super
    end

    # Checks if the array includes the value
    #
    # @example
    #   condition = Set.new [:foo, :bar]
    #   condition[:foo] # => true
    #   condition[:baz] # => false
    #
    # @param (see Separator::Condition#[])
    #
    # @return (see Separator::Condition#[])
    #
    def [](value)
      attribute.include? value
    end

  end # class Collection

end # module Separator
