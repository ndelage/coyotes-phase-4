require_relative 'gcf'

describe GCF do
  describe "#compute" do
    it "returns the max of the intersection of factors" do
      GCF.should_receive(:factors).with(9).and_return [3,9]
      GCF.should_receive(:factors).with(3).and_return [3]

      expect(GCF.compute(9, 3)).to eq 3
    end

    it "supports any number of arguments" do
      expect(GCF.compute(9, 27, 54)).to eq 9
    end

    it "requires at least more than one argument" do
      expect{GCF.compute(9)}.to raise_exception(ArgumentError)
    end

    it "returns nil when there are no common factors" do
      expect(GCF.compute(5, 3)).to eq nil
    end

    describe "guard clauses" do
      it "raises an ArgumentError when valid_arguments? returns false" do
        GCF.should_receive(:valid_arguments?).with([nil, 3.0]).and_return false

        expect{GCF.compute(nil, 3.0)}.to raise_exception ArgumentError
      end
    end

    describe "#valid_arguments?" do
      it "returns false when val_1 is not an integer" do
        expect(GCF.valid_arguments?([3.0, 3])).to be_false
      end

      it "returns true when both arguments are integers" do
        expect(GCF.valid_arguments?([3, 3])).to be_true
      end
    end
  end

  describe "#factors" do
    it "returns the factors" do
      expect(GCF.factors(9)).to eq [3,9]
    end

    it "returns an empty array for 1" do
      expect(GCF.factors(1)).to eq []
    end

    it "returns an empty array for 0" do
      expect(GCF.factors(0)).to eq []
    end

    it "returns an empty array for nil" do
      expect(GCF.factors(nil)).to eq []
    end
  end

end
