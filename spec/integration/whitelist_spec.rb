# encoding: utf-8

describe "Whitelist" do

  it "works with array" do
    separator = Separator.new only: [:foo, :qux]

    expect(separator[:foo]).to eql(true)
    expect(separator[:bar]).to eql(false)
  end

  it "works with regexp" do
    separator = Separator.new only: /foo/

    expect(separator[:foobar]).to eql(true)
    expect(separator[:bar]).to eql(false)
  end

  it "works with range" do
    separator = Separator.new only: 1..3

    expect(separator[2.4]).to eql(true)
    expect(separator[0]).to eql(false)
  end

  it "works with proc" do
    separator = Separator.new only: -> value { value.is_a? Hash }

    expect(separator[foo: :FOO]).to eql(true)
    expect(separator[:foo]).to eql(false)
  end

end # describe Whitelist
