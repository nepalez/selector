# encoding: utf-8

require "ice_nine"
require "singleton"

require_relative "separator/condition"
require_relative "separator/anything"
require_relative "separator/nothing"

# Composable filters for lists of values
#
module Separator

  private # for yard

  ANYTHING = Anything.instance
  NOTHING  = Nothing.instance

end # module Separator
