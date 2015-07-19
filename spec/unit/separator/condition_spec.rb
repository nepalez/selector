# encoding: utf-8

module Separator

  describe Separator::Condition do

    let(:test_klass) { Class.new(described_class)           }
    let(:attributes) { 2.times.map { double(freeze: true) } }
    let(:condition)  { test_klass.new(*attributes)          }

    describe ".new" do

      subject { condition }

      it { is_expected.to be_kind_of Comparable }
      it { is_expected.to be_frozen }

      it "doesn't freeze attributes" do
        expect { subject }.not_to change { attributes.frozen? }
      end

    end # describe .new

    describe "#attributes" do

      subject { condition.attributes }

      it { is_expected.to eql attributes }
      it { is_expected.to be_frozen }

      context "by default" do

        let(:condition) { test_klass.new }
        it { is_expected.to eql [] }

      end # context

    end # describe #attributes

    describe "#attribute" do

      subject { condition.attribute }
      it { is_expected.to eql attributes.first }

    end # describe #attribute

    describe "#==" do

      subject { condition == other }

      let(:other) { test_klass.new(*attributes) }

      context "with the same type and attributes" do

        it { is_expected.to eql(true) }

      end # context

      context "with other attributes" do

        let(:other) { test_klass.new }
        it { is_expected.to eql(false) }

      end # context

      context "with another type" do

        let(:other) { described_class.new(*attributes) }
        it { is_expected.to eql(false) }

      end # context

    end # describe #==

    describe "#[]" do

      subject { condition[:foo] }

      it "should be implemented" do
        expect { subject }.to raise_error do |error|
          expect(error).to be_kind_of NotImplementedError
          expect(error.message).to eql "#{test_klass}#[] not implemented"
        end
      end

    end # describe #[]

    describe "#!" do

      subject { !condition }

      it "returns the inversion" do
        expect(subject).to be_kind_of Not
        expect(subject.attributes).to eql [condition]
      end

    end # describe #!

  end # describe Separator::Condition

end # module Separator
