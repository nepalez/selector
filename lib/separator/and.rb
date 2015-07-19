# encoding: utf-8

module Separator

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
    #     left  = Separator.new only: /foo/
    #     right = Separator.new only: /bar/
    #     composition = Separator::And.new(left, right)
    #
    #     composition[:foo]    # => false
    #     composition[:bar]    # => false
    #     composition[:foobar] # => true
    #
    # @param (see Separator::Composition#[])
    #
    # @return (see Separator::Composition#[])
    #
    def [](value)
      true ^ attributes.detect { |part| !part[value] }
    end

    # Adds the other condition to the composition (avoids nesting)
    #
    # @param (see Separator::Composition#&)
    #
    # @return (see Separator::Composition#&)
    #
    def &(other)
      And.new(*attributes, other)
    end

    # Adds inversion of the other condition to the composition (avoids nesting)
    #
    # @param (see Separator::Composition#-)
    #
    # @return (see Separator::Composition#-)
    #
    def -(other)
      And.new(*attributes, !other)
    end

  end # class And

end # module Separator
