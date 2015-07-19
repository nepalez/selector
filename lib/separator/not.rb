# encoding: utf-8

module Separator

  # The inversion of another condition
  #
  class Not < Condition

    # @private
    def self.new(source)
      return NOTHING  if source.equal? ANYTHING
      return ANYTHING if source.equal? NOTHING
      super
    end

    # Checks if the value doesn't satisfy inverted condition
    #
    # @example
    #   condition = Separator.new(only: [:foo])
    #   inversion[:foo] # => true
    #   inversion[:bar] # => false
    #
    #   inversion = Not.new(condition)
    #   inversion[:foo] # => false
    #   inversion[:bar] # => true
    #
    # @param (see Separator::Condition#[])
    #
    # @return (see Separator::Condition#[])
    #
    def [](value)
      !attribute[value]
    end

    # Returns the inverted condition (avoids double negation)
    #
    # @example
    #   condition = Separator.new(only: [:foo])
    #   inversion = Not.new(condition)
    #   !inversion == condition # => true
    #
    # @return (see Separator::Condition#!)
    #
    def !
      attribute
    end

  end # class Not

end # module Separator
