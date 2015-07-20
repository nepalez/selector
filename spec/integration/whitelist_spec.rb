# encoding: utf-8

describe "Whitelist" do

  it "works with array" do
    selector = Selector.new only: [:foo, :qux]

    expect(selector[:foo]).to eql(true)
    expect(selector[:bar]).to eql(false)
  end

  it "works with regexp" do
    selector = Selector.new only: /foo/

    expect(selector[:foobar]).to eql(true)
    expect(selector[:bar]).to eql(false)
  end

  it "works with range" do
    selector = Selector.new only: 1..3

    expect(selector[2.4]).to eql(true)
    expect(selector[0]).to eql(false)
  end

  it "works with proc" do
    selector = Selector.new only: -> value { value.is_a? Hash }

    expect(selector[foo: :FOO]).to eql(true)
    expect(selector[:foo]).to eql(false)
  end

end # describe Whitelist
