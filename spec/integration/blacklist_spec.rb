# encoding: utf-8

describe "Blacklist" do

  it "works with array" do
    separator = Separator.new except: [:foo, :qux]

    expect(separator[:foo]).to eql(false)
    expect(separator[:bar]).to eql(true)
  end

  it "works with regexp" do
    separator = Separator.new except: /foo/

    expect(separator[:foobar]).to eql(false)
    expect(separator[:bar]).to eql(true)
  end

  it "works with range" do
    separator = Separator.new except: 1..3

    expect(separator[2.4]).to eql(false)
    expect(separator[0]).to eql(true)
  end

  it "works with proc" do
    separator = Separator.new except: -> value { value.is_a? Hash }

    expect(separator[foo: :FOO]).to eql(false)
    expect(separator[:foo]).to eql(true)
  end

end # describe Whitelist
