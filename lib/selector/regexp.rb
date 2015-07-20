# encoding: utf-8

module Selector

  # The condition checks if a value matches the regexp
  #
  # @example (see #[])
  #
  class Regexp < Condition

    # @!method initialize(regexp)
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
    #   condition = Selector::Regexp.new /1/
    #   condition[11] # => true
    #   condition[22] # => false
    #
    # @param (see Selector::Condition#[])
    #
    # @return (see Selector::Condition#[])
    #
    def [](value)
      value.to_s[attribute] ? true : false
    end

    # Creates an OR composition
    #
    # If other value is a regexp, then creates modified regexp to avoid nesting
    #
    # @param (see Selector::Composition#|)
    #
    # @return (see Selector::Composition#|)
    #
    def |(other)
      return super unless other.instance_of? Regexp
      Regexp.new(/(#{attribute})|(#{other.attribute})/)
    end

  end # class Regexp < Condition

end # module Selector
