# encoding: utf-8

module Separator

  describe Separator::Anything do

    let(:anything) { described_class.instance }

    describe ".instance" do

      subject { anything }

      it { is_expected.to be_kind_of Condition }
      it { is_expected.to be_kind_of Singleton }
      it { is_expected.to be_frozen }

    end # describe .instance

    describe "#[]" do

      subject { anything[:foo] }

      it { is_expected.to eql(true) }

    end # describe #[]

  end # describe Separator::Anything

end # module Separator
