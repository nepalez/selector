# encoding: utf-8

module Separator

  describe Separator do

    describe "::ANYTHING" do

      subject { described_class::ANYTHING }
      it { is_expected.to be_kind_of Anything }

    end # describe ::ANYTHING

    describe "::NOTHING" do

      subject { described_class::NOTHING }
      it { is_expected.to be_kind_of Nothing }

    end # describe ::NOTHING

  end # describe Separator

end # module Separator
