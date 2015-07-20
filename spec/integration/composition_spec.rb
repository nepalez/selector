# encoding: utf-8

describe "Composition" do

  it "& works" do
    blacklist = Selector.new except: /bar/
    whitelist = Selector.new only: /foo/
    selector = whitelist & blacklist

    expect(selector[:foobaz]).to eql(true)
    expect(selector[:foobar]).to eql(false)
  end

  it "- works" do
    whitelist = Selector.new only: /foo/
    blacklist = Selector.new except: /bar/
    selector = whitelist - blacklist

    expect(selector[:foobar]).to eql(true)
    expect(selector[:bar]).to eql(false)
    expect(selector[:foo]).to eql(false)
  end

  it "| works" do
    whitelist = Selector.new only: 4..8
    blacklist = Selector.new except: 1..5
    selector = whitelist | blacklist

    expect(selector[0.5]).to eql(true)
    expect(selector[5.5]).to eql(true)
    expect(selector[2.5]).to eql(false)
  end

end # describe Composition
