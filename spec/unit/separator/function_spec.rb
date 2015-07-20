# encoding: utf-8

module Separator

  describe Separator::Function do

    let(:function) { described_class.new -> v { v[/foo/] } }

    describe ".new" do

      subject { function }

      it { is_expected.to be_kind_of Condition }
      it { is_expected.to be_frozen }

      it "requires exactly 1 argument" do
        expect { described_class.new }.to raise_error ArgumentError
        expect { described_class.new [:foo], [:bar] }
          .to raise_error ArgumentError
      end

    end # describe .new

    describe "#[]" do

      subject { function[value] }

      context "existing value" do

        let(:value) { :foo }
        it { is_expected.to eql(true) }

      end # context

      context "absent value" do

        let(:value) { :baz }
        it { is_expected.to eql(false) }

      end # context

    end # describe #[]

  end # describe Separator::Function

end # module Separator
