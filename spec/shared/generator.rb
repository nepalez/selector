# encoding: utf-8

# Generates the condition object with regexp
def generate(regexp)
  klass = Class.new(Separator::Condition)
  klass.send(:define_method, :[]) { |value| value[regexp] }
  klass.new
end
