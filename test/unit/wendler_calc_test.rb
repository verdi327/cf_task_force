require 'test_helper'

class WendlerCalcTest < ActiveSupport::TestCase
  describe WendlerCalc do
    describe "when week 1" do
      it "must calc 135 correctly" do
        @wc = WendlerCalc.new(135, "1")
        result = @wc.run
        expected = [["5", 50], ["5", 65], ["5", 80], ["5", 95], ["5+", 105]]
        result.must_equal(expected)
      end
    end

    describe "when week 2" do
      it "must calc 135 correctly" do
        @wc = WendlerCalc.new(135, "2")
        result = @wc.run
        expected = [["5", 50], ["5", 65], ["3", 85], ["3", 100], ["3+", 110]]
        result.must_equal(expected)	
      end

      it "must calc 125 correctly" do
        @wc = WendlerCalc.new(125, "2")
        result = @wc.run
        expected = [["5", 45], ["5", 60], ["3", 80], ["3", 90], ["3+", 105]]
        result.must_equal(expected) 
      end
    end

    describe "when week 3" do
      it "must calc 135 correctly" do
        @wc = WendlerCalc.new(135, "3")
        result = @wc.run
        expected = [["5", 50], ["5", 65], ["5", 95], ["3", 105], ["1+", 120]]
        result.must_equal(expected)	
      end
    end

    describe "when week 4" do
      it "must calc 135 correctly" do
        @wc = WendlerCalc.new(135, "4")
        result = @wc.run
        expected = [["5", 50], ["5", 65], ["5", 65], ["5", 65], ["5", 75]]
        result.must_equal(expected)	
      end
    end
  end
end