# encoding: utf-8

module Separator

  # Describe an immutable condition for selecting values
  #
  class Condition

    include Comparable

    # @!attribute [r] attributes
    #
    # @return [Array] The array of initialized attributes
    #
    attr_reader :attributes

    # The first attribute
    #
    # @return [Object]
    #
    def attribute
      attributes.first
    end

    # @private
    def initialize(*attributes)
      @attributes = attributes
      IceNine.deep_freeze(self)
    end

    # Compares the condition to the other object by type and attributes
    #
    # @param [Object] other
    #
    # @return [Boolean]
    #
    def ==(other)
      other.instance_of?(self.class) && attributes.eql?(other.attributes)
    end

    # @!method [](value)
    # Checks if the value satisfies the condtion
    #
    # @param [Object] value
    #
    # @return [Boolean]
    #
    # @abstract
    # @raise [NotImplementedError] by default
    #
    def [](_value)
      fail NotImplementedError.new "#{self.class}#[] not implemented"
    end

  end # class Condition

end # module Separator
