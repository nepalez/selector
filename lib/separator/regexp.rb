# encoding: utf-8

module Separator

  # The condition checks if a value matches the regexp
  #
  # @example (see #[])
  #
  class Regexp < Condition

    # Initializes the condition with the regexp
    #
    # @param [::Regexp] regexp
    #
    def initialize(_)
      super
    end

    # Checks if the stringified value matches the regexp
    #
    # @example
    #   condition = Separator::Regexp.new /1/
    #   condition[11] # => true
    #   condition[22] # => false
    #
    # @param (see Separator::Condition#[])
    #
    # @return (see Separator::Condition#[])
    #
    def [](value)
      nil ^ value.to_s[attribute]
    end

    # Creates an OR composition
    #
    # If other value is a regexp, then creates modified regexp to avoid nesting
    #
    # @param (see Separator::Composition#|)
    #
    # @return (see Separator::Composition#|)
    #
    def |(other)
      return super unless other.instance_of? Regexp
      Regexp.new(/(#{attribute})|(#{other.attribute})/)
    end

  end # class Regexp < Condition

end # module Separator
