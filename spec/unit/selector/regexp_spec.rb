# encoding: utf-8

module Selector

  describe Selector::Regexp do

    let(:one) { described_class.new(/1\.1/) }
    let(:two) { described_class.new(/2/) }

    describe ".new" do

      subject { one }

      it { is_expected.to be_kind_of Condition }
      it { is_expected.to be_frozen }

      it "requires exactly 1 argument" do
        expect { described_class.new }.to raise_error ArgumentError
        expect { described_class.new(/1/, /2/) }
          .to raise_error ArgumentError
      end

    end # describe .new

    describe "#[]" do

      subject { one[value] }

      context "value that matches the regexp" do

        let(:value) { 1.1 }
        it { is_expected.to eql(true) }

      end # context

      context "value that doesn't match the regexp" do

        let(:value) { 3 }
        it { is_expected.to eql(false) }

      end # context

    end # describe #[]

    describe "#|" do

      context "regexp" do

        subject { one | two }

        it "updates the regexp" do
          expect(subject).to be_kind_of Regexp
          expect(subject.attribute).to eql(/(#{/1\.1/})|(#{/2/})/)
        end

      end # context

      context "value that doesn't match the regexp" do

        subject { one | Condition.new }
        it { is_expected.to be_kind_of(Or) }

      end # context

    end # describe #[]

  end # describe Selector::Regexp

end # module Selector
