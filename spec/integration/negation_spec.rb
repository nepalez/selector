# encoding: utf-8

describe "Negation" do

  it "works" do
    blacklist = Separator.new except: /bar/
    separator = !blacklist

    expect(separator[:foo]).to eql(false)
    expect(separator[:bar]).to eql(true)
  end

end # describe Negation
