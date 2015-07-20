# encoding: utf-8

# Generates the condition object with regexp
def generate(regexp)
  klass = Class.new(Selector::Condition)
  klass.send(:define_method, :[]) { |value| nil ^ value[regexp] }
  klass.new
end
