# encoding: utf-8

module Selector

  # The composition of several conditions. Requires each of them to be satisfied
  #
  # @example (see #[])
  #
  class And < Condition

    # @private
    def self.new(*attributes)
      attrs = attributes.uniq - [ANYTHING]

      return ANYTHING    if attrs.empty?
      return attrs.first if attrs.count.equal?(1)
      return NOTHING     if attrs.include? NOTHING
      return NOTHING     if (attrs & attrs.map(&:!)).any?

      super(*attrs)
    end

    # Checks if value satisfies each of composed conditions
    #
    #   @example
    #     left  = Selector.new only: /foo/
    #     right = Selector.new only: /bar/
    #     composition = Selector::And.new(left, right)
    #
    #     composition[:foo]    # => false
    #     composition[:bar]    # => false
    #     composition[:foobar] # => true
    #
    # @param (see Selector::Composition#[])
    #
    # @return (see Selector::Composition#[])
    #
    def [](value)
      attributes.detect { |part| !part[value] } ? false : true
    end

    # Adds the other condition to the composition (avoids nesting)
    #
    # @param (see Selector::Composition#&)
    #
    # @return (see Selector::Composition#&)
    #
    def &(other)
      And.new(*attributes, other)
    end

    # Adds inversion of the other condition to the composition (avoids nesting)
    #
    # @param (see Selector::Composition#-)
    #
    # @return (see Selector::Composition#-)
    #
    def -(other)
      And.new(*attributes, !other)
    end

  end # class And

end # module Selector
