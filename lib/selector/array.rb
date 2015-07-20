# encoding: utf-8

module Selector

  # The condition checks if a value is included to the array
  #
  class Array < Collection

    # @private
    def initialize(array)
      super Set.new(array)
    end

    # Creates an AND composition
    #
    # If other value is a array, then creates modified array to avoid nesting
    #
    # @param (see Selector::Composition#&)
    #
    # @return (see Selector::Composition#&)
    #
    def &(other)
      return super unless other.instance_of? self.class
      self.class.new attribute & other.attribute
    end

    # Creates an OR composition
    #
    # If other value is a array, then creates modified array to avoid nesting
    #
    # @param (see Selector::Composition#|)
    #
    # @return (see Selector::Composition#|)
    #
    def |(other)
      return super unless other.instance_of? self.class
      self.class.new attribute | other.attribute
    end

  end # class Array

end # module Selector
