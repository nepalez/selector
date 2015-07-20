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

    describe ".build" do

      subject { described_class.build value }

      context "ANYTHING" do

        let(:value) { ANYTHING }
        it { is_expected.to eql ANYTHING }

      end # context

      context "NOTHING" do

        let(:value) { NOTHING }
        it { is_expected.to eql NOTHING }

      end # context

      context "regexp" do

        let(:value) { /foo/ }

        it "builds the Regexp" do
          expect(subject).to be_kind_of Regexp
          expect(subject.attribute).to eql(/foo/)
        end

      end # context

      context "function" do

        let(:value) { -> v { v == :foo } }

        it "builds the Function" do
          expect(subject).to be_kind_of Function
          expect(subject[:foo]).to eql(true)
          expect(subject[:bar]).to eql(false)
        end

      end # context

      context "array" do

        let(:value) { [:foo, :bar] }

        it "builds the Array" do
          expect(subject).to be_kind_of Array
          expect(subject.attribute).to eql(Set.new [:foo, :bar])
        end

      end # context

      context "set" do

        let(:value) { Set.new [:foo, :bar] }

        it "builds the Array" do
          expect(subject).to be_kind_of Array
          expect(subject.attribute).to eql(Set.new [:foo, :bar])
        end

      end # context

      context "range" do

        let(:value) { 1..4 }

        it "builds the Collection" do
          expect(subject).to be_kind_of Collection
          expect(subject.attribute).to eql(1..4)
        end

      end # context

      context "single object" do

        let(:value) { 1 }

        it "builds the Array" do
          expect(subject).to be_kind_of Array
          expect(subject.attribute).to eql(Set.new [1])
        end

      end # context

    end # describe #build

    describe ".new" do

      subject { described_class.new options }

      context "with empty options" do

        let(:options) { {} }
        it { is_expected.to eql ANYTHING }

      end # context

      context "with a whitelist" do

        let(:options) { { only: /foo/ } }

        it "creates condition" do
          expect(subject).to be_kind_of Regexp
          expect(subject.attribute).to eql(/foo/)
        end

      end # context

      context "with a blacklist" do

        let(:options) { { except: /foo/ } }

        it "creates condition" do
          expect(subject).to be_kind_of Not
          inverted = subject.attribute

          expect(inverted).to be_kind_of Regexp
          expect(inverted.attribute).to eql(/foo/)
        end

      end

    end # describe .new

  end # describe Separator

end # module Separator
