# encoding: utf-8

module Separator

  describe Separator do

    describe "::ANYTHING" do

      subject { described_class::ANYTHING }
      it { is_expected.to be_kind_of Anything }

    end # describe ::ANYTHING

  end # describe Separator

end # module Separator
