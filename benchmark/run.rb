require "selector"
require "benchmark/ips"

puts "============================================================"
puts "Equality"
puts "value == :foo"
puts "============================================================"

Benchmark.ips do |x|
  x.config time: 10, warmup: 5

  value = :foo
  selector = Selector.new only: :foo

  x.report("Selector") do
    selector[:foo]
  end

  x.report("Native") do
    value == :foo
  end

  x.compare!
end

puts "============================================================"
puts "Presence in array"
puts "[:foo, :bar].include? value"
puts "============================================================"

Benchmark.ips do |x|
  x.config time: 10, warmup: 5

  array = [:foo, :bar]
  selector = Selector.new only: [:foo, :bar]

  x.report("Selector") do
    selector[:foo]
  end

  x.report("Native") do
    array.include? :foo
  end

  x.compare!
end

puts "============================================================"
puts "Presence in a range"
puts "(1..3).include? value"
puts "============================================================"

Benchmark.ips do |x|
  x.config time: 10, warmup: 5

  range = 1..3
  selector = Selector.new only: range

  x.report("Selector") do
    selector[2.1]
  end

  x.report("Native") do
    range.include? 2.1
  end

  x.compare!
end

puts "============================================================"
puts "Matching regexp"
puts "value.to_s[/1/]"
puts "============================================================"

Benchmark.ips do |x|
  x.config time: 10, warmup: 5

  regexp = /1/
  selector = Selector.new only: regexp

  x.report("Selector") do
    selector[1]
  end

  x.report("Native") do
    1.to_s[regexp]
  end

  x.compare!
end

puts "============================================================"
puts "Result of function call"
puts "proc { |value| value == :foo }.call(value) ? true : false"
puts "============================================================"

Benchmark.ips do |x|
  x.config time: 10, warmup: 5

  function = -> v { v == :foo }
  selector = Selector.new only: function

  x.report("Selector") do
    selector[:foo]
  end

  x.report("Native") do
    function.call(:foo) ? true : false
  end

  x.compare!
end
