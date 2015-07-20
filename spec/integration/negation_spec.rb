# encoding: utf-8

describe "Negation" do

  it "works" do
    blacklist = Selector.new except: /bar/
    selector = !blacklist

    expect(selector[:foo]).to eql(false)
    expect(selector[:bar]).to eql(true)
  end

end # describe Negation
