# encoding: utf-8

module Separator

  describe Separator::Nothing do

    let(:nothing) { described_class.instance }

    describe ".instance" do

      subject { nothing }

      it { is_expected.to be_kind_of Condition }
      it { is_expected.to be_kind_of Singleton }
      it { is_expected.to be_frozen }

    end # describe .instance

    describe "#[]" do

      subject { nothing[:foo] }

      it { is_expected.to eql(false) }

    end # describe #[]

  end # describe Separator::Nothing

end # module Separator
