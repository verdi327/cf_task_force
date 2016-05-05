require 'test_helper'

class WeightCalcTest < ActiveSupport::TestCase
  describe WeightCalc do
    describe "when a male bar is used" do
      it "must calc 40 correctly" do
        @wc = WeightCalc.new(40,45)
        result = @wc.calc
        result.must_equal "Weight Must Be Greater Than Bar"
      end

      it "must calc 45 correctly" do
        @wc = WeightCalc.new(45,45)
        result = @wc.calc
        result.must_equal "No Weight Needed"
      end

      it "must calc 100 correctly" do
        @wc = WeightCalc.new(100,45)
        result = @wc.calc
        result["25"].must_equal(2)
        result["2.5"].must_equal(2)
      end

      it "must calc 135 correctly" do
        @wc = WeightCalc.new(135,45)
        result = @wc.calc
        result["45"].must_equal(2)
      end

      it "must calc 185 correctly" do
        @wc = WeightCalc.new(185,45)
        result = @wc.calc
        result["45"].must_equal(2)
        result["25"].must_equal(2)
      end

      it "must calc 192 correctly" do
        @wc = WeightCalc.new(192,45)
        result = @wc.calc
        result["45"].must_equal(2)
        result["25"].must_equal(2)
        result["5"].must_equal(2)
      end

      it "must calc 200 correctly" do
        @wc = WeightCalc.new(200,45)
        result = @wc.calc
        result["45"].must_equal(2)
        result["25"].must_equal(2)
        result["5"].must_equal(2)
        result["2.5"].must_equal(2)
      end
    end

    describe "when a women bar is used" do 
      it "must calc 40 correctly" do
        @wc = WeightCalc.new(30,35)
        result = @wc.calc
        result.must_equal "Weight Must Be Greater Than Bar"
      end

      it "must calc 45 correctly" do
        @wc = WeightCalc.new(35,35)
        result = @wc.calc
        result.must_equal "No Weight Needed"
      end

      it "must calc 100 correctly" do
        @wc = WeightCalc.new(100,35)
        result = @wc.calc
        result["25"].must_equal(2)
        result["5"].must_equal(2)
        result["2.5"].must_equal(2)
      end

      it "must calc 135 correctly" do
        @wc = WeightCalc.new(135,35)
        result = @wc.calc
        result["45"].must_equal(2)
        result["5"].must_equal(2)
      end

      it "must calc 185 correctly" do
        @wc = WeightCalc.new(185,35)
        result = @wc.calc
        result["45"].must_equal(2)
        result["25"].must_equal(2)
        result["5"].must_equal(2)
      end

      it "must calc 212 correctly" do
        @wc = WeightCalc.new(212,35)
        result = @wc.calc
        result["45"].must_equal(4)
      end
    end
  end
end
