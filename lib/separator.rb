# encoding: utf-8

require "ice_nine"
require "singleton"

require_relative "separator/condition"
require_relative "separator/anything"

# Composable filters for lists of values
#
module Separator

  private # for yard

  ANYTHING = Anything.instance

end # module Separator
