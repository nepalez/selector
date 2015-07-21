# encoding: utf-8

require "ice_nine"
require "singleton"
require "set"

require_relative "selector/condition"
require_relative "selector/anything"
require_relative "selector/nothing"

require_relative "selector/not"
require_relative "selector/and"
require_relative "selector/or"

require_relative "selector/collection"
require_relative "selector/array"
require_relative "selector/regexp"
require_relative "selector/function"

# Composable filters for lists of values
#
module Selector

  # Creates a condition from options
  #
  # @param [Hash] options
  #
  # @return [Selector::Condition]
  #
  def self.new(options)
    white = options.fetch(:only)   { ANYTHING }
    black = options.fetch(:except) { NOTHING  }
    build(white) - build(black)
  end

  # Factory method that builds a condition instance depending on argument type
  #
  # @param [Object] clause
  #
  # @return [Selector::Condition]
  #
  def self.build(clause)
    return clause                 if [ANYTHING, NOTHING].include? clause
    return Regexp.new(clause)     if clause.instance_of? ::Regexp
    return Array.new(clause)      if [::Array, ::Set].include? clause.class
    return Collection.new(clause) if clause.is_a? Enumerable
    return Function.new(clause)   if clause.respond_to? :call
    Array.new [clause]
  end

  private # for yard

  ANYTHING = Anything.instance
  NOTHING  = Nothing.instance

end # module Selector
