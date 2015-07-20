# encoding: utf-8

module Separator

  describe Separator::Array do

    let(:left)  { described_class.new [:foo, :bar] }
    let(:right) { described_class.new [:bar, :baz] }

    describe ".new" do

      subject { left }

      it { is_expected.to be_kind_of Collection }

      it { is_expected.to be_frozen }

      it "sets the attribute" do
        expect(subject.attribute).to eql(Set.new [:foo, :bar])
      end

    end # describe .new

    describe "#&" do

      subject { left & right }

      context "array" do

        it "returns the array" do
          expect(subject).to be_kind_of described_class
        end

        it "composes the attributes" do
          expect(subject.attribute).to eql(Set.new [:bar])
        end

      end # context

      context "non-array" do

        let(:right) { Condition.new }
        it { is_expected.to be_kind_of(And) }

      end # context

    end # describe #&

    describe "#|" do

      subject { left | right }

      context "array" do

        it "returns the array" do
          expect(subject).to be_kind_of described_class
        end

        it "composes the attributes" do
          expect(subject.attribute).to eql(Set.new [:foo, :bar, :baz])
        end

      end # context

      context "non-array" do

        let(:right) { Condition.new }
        it { is_expected.to be_kind_of(Or) }

      end # context

    end # describe #&

  end # describe Separator::Array

end # module Separator
