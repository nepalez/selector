# encoding: utf-8

module Selector

  # The composition of several conditions. Requires any of them to be satisfied
  #
  # @example (see #[])
  #
  class Or < Condition

    # @private
    def self.new(*attributes)
      attrs = attributes.uniq - [NOTHING]

      return NOTHING     if attrs.empty?
      return attrs.first if attrs.count.equal?(1)
      return ANYTHING    if attrs.include? ANYTHING
      return ANYTHING    if (attrs & attrs.map(&:!)).any?

      super(*attrs)
    end

    # Checks if value satisfies any of composed conditions
    #
    #   @example
    #     left  = Selector.new only: /foo/
    #     right = Selector.new only: /bar/
    #     composition = Selector::Or.new(left, right)
    #
    #     composition[:foo] # => true
    #     composition[:bar] # => true
    #     composition[:baz] # => false
    #
    # @param (see Selector::Composition#[])
    #
    # @return (see Selector::Composition#[])
    #
    def [](value)
      attributes.detect { |part| part[value] } ? true : false
    end

    # Adds the other condition to the composition (avoids nesting)
    #
    # @param (see Selector::Composition#|)
    #
    # @return (see Selector::Composition#|)
    #
    def |(other)
      Or.new(*attributes, other)
    end

  end # class Or

end # module Selector
