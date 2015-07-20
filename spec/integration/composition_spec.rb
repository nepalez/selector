# encoding: utf-8

describe "Composition" do

  it "& works" do
    blacklist = Separator.new except: /bar/
    whitelist = Separator.new only: /foo/
    separator = whitelist & blacklist

    expect(separator[:foobaz]).to eql(true)
    expect(separator[:foobar]).to eql(false)
  end

  it "- works" do
    whitelist = Separator.new only: /foo/
    blacklist = Separator.new except: /bar/
    separator = whitelist - blacklist

    expect(separator[:foobar]).to eql(true)
    expect(separator[:bar]).to eql(false)
    expect(separator[:foo]).to eql(false)
  end

  it "| works" do
    whitelist = Separator.new only: 4..8
    blacklist = Separator.new except: 1..5
    separator = whitelist | blacklist

    expect(separator[0.5]).to eql(true)
    expect(separator[5.5]).to eql(true)
    expect(separator[2.5]).to eql(false)
  end

end # describe Composition
