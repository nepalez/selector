# encoding: utf-8

require "shared/generator"

module Selector

  describe Selector::And do

    let(:foo) { generate(/foo/) }
    let(:bar) { generate(/bar/) }
    let(:baz) { generate(/baz/) }

    let(:composition) { described_class.new(foo, bar) }

    describe ".new" do

      subject { composition }

      it { is_expected.to be_kind_of Condition }
      it { is_expected.to be_frozen }

      it "returns ANYTHING when possible" do
        subject = described_class.new ANYTHING
        expect(subject).to eql ANYTHING
      end

      it "returns NOTHING if exists" do
        subject = described_class.new foo, bar, NOTHING
        expect(subject).to eql NOTHING
      end

      it "returns NOTHING when possible" do
        subject = described_class.new foo, !foo
        expect(subject).to eql NOTHING
      end

      it "returns the only attribute" do
        subject = described_class.new foo, ANYTHING
        expect(subject).to eql foo
      end

      it "ignores duplication" do
        subject = described_class.new foo, bar, foo
        expect(subject.attributes).to eql [foo, bar]
      end

      it "ignores ANYTHING" do
        subject = described_class.new foo, bar, ANYTHING
        expect(subject.attributes).to eql [foo, bar]
      end

    end # describe .new

    describe "#[]" do

      subject { composition[value] }

      context "when all conditions are satisfied" do

        let(:value) { "foobar" }
        it { is_expected.to eql(true) }

      end # context

      context "when any condition isn't satisfied" do

        let(:value) { "foo" }
        it { is_expected.to eql(false) }

      end # context

    end # describe #[]

    describe "#&" do

      subject { composition & baz }

      it { is_expected.to be_kind_of(described_class) }

      it "updates conditions (avoids nesting)" do
        expect(subject.attributes).to eql [foo, bar, baz]
      end

    end # describe #&

    describe "#-" do

      subject { composition - baz }

      it { is_expected.to be_kind_of(described_class) }

      it "updates conditions (avoids nesting)" do
        expect(subject.attributes).to contain_exactly(foo, bar, !baz)
      end

    end # describe #-

  end # describe Selector::And

end # module Selector
