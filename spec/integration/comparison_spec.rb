# encoding: utf-8

describe "Comparison" do

  it "works" do
    left  = Selector.new(only: /foo/, except: /bar/)
    right = Selector.new(only: /foo/, except: /bar/)

    expect(left).to eql right
  end

end # describe Comparison
