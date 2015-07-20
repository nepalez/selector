# encoding: utf-8

describe "Blacklist" do

  it "works with array" do
    selector = Selector.new except: [:foo, :qux]

    expect(selector[:foo]).to eql(false)
    expect(selector[:bar]).to eql(true)
  end

  it "works with regexp" do
    selector = Selector.new except: /foo/

    expect(selector[:foobar]).to eql(false)
    expect(selector[:bar]).to eql(true)
  end

  it "works with range" do
    selector = Selector.new except: 1..3

    expect(selector[2.4]).to eql(false)
    expect(selector[0]).to eql(true)
  end

  it "works with proc" do
    selector = Selector.new except: -> value { value.is_a? Hash }

    expect(selector[foo: :FOO]).to eql(false)
    expect(selector[:foo]).to eql(true)
  end

end # describe Whitelist
