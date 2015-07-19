# encoding: utf-8

module Separator

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
    #     left  = Separator.new only: /foo/
    #     right = Separator.new only: /bar/
    #     composition = Separator::Or.new(left, right)
    #
    #     composition[:foo] # => true
    #     composition[:bar] # => true
    #     composition[:baz] # => false
    #
    # @param (see Separator::Composition#[])
    #
    # @return (see Separator::Composition#[])
    #
    def [](value)
      nil ^ attributes.detect { |part| part[value] }
    end

    # Adds the other condition to the composition (avoids nesting)
    #
    # @param (see Separator::Composition#|)
    #
    # @return (see Separator::Composition#|)
    #
    def |(other)
      Or.new(*attributes, other)
    end

  end # class Or

end # module Separator
