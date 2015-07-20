# encoding: utf-8

require "ice_nine"
require "singleton"

require_relative "separator/condition"
require_relative "separator/anything"
require_relative "separator/nothing"

require_relative "separator/not"
require_relative "separator/and"
require_relative "separator/or"

require_relative "separator/collection"
require_relative "separator/array"
require_relative "separator/regexp"
require_relative "separator/function"

# Composable filters for lists of values
#
module Separator

  # Factory method that builds a condition instance depending on argument type
  #
  # @param [Object] clause
  #
  # @return [Separator::Condition]
  #
  def self.build(clause)
    return clause                 if [ANYTHING, NOTHING].include? clause
    return Regexp.new(clause)     if clause.instance_of? ::Regexp
    return Array.new(clause)      if [::Array, Set].include? clause.class
    return Collection.new(clause) if clause.is_a? Enumerable
    return Function.new(clause)   if clause.respond_to? :call
    Array.new [clause]
  end

  private # for yard

  ANYTHING = Anything.instance
  NOTHING  = Nothing.instance

end # module Separator
