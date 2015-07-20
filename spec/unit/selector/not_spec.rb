# encoding: utf-8

module Selector

  describe Selector::Not do

    let(:inversion) { described_class.new condition }
    let(:condition) do
      result = double freeze: true
      allow(result).to receive(:[]) { |value| value == :foo }
      result
    end

    describe ".new" do

      subject { inversion }

      it { is_expected.to be_kind_of Condition }
      it { is_expected.to be_frozen }

      context "ANYTHING" do

        let(:condition) { ANYTHING }
        it { is_expected.to eql NOTHING }

      end # context

      context "NOTHING" do

        let(:condition) { NOTHING }
        it { is_expected.to eql ANYTHING }

      end # context

      context "other" do

        it { is_expected.to be_kind_of described_class }

      end # context

    end # describe .new

    describe "#[]" do

      it "inverts the condition" do
        expect(inversion[:foo]).to eql(false)
        expect(inversion[:bar]).to eql(true)
      end

    end # describe #[]

    describe "#!" do

      subject { !inversion }
      it { is_expected.to equal condition }

    end # describe #!

  end # describe Selector::Not

end # module Selector
