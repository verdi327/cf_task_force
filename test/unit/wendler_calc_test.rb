require 'test_helper'

class WendlerCalcTest < ActiveSupport::TestCase
  describe WendlerCalc do
    describe "when week 1" do
      it "must calc 135 correctly" do
        @wc = WendlerCalc.new(135, "1")
        result = @wc.run
        expected = [["5",49], ["5",61], ["5",79], ["5",92], ["5+",104] ]
        result.must_equal(expected)
      end
    end

    describe "when week 2" do
      it "must calc 135 correctly" do
        @wc = WendlerCalc.new(135, "2")
        result = @wc.run
        expected = [["5", 49], ["5", 61], ["3", 85], ["3", 98], ["3+", 110]]
        result.must_equal(expected)	
      end
    end

    describe "when week 3" do
      it "must calc 135 correctly" do
        @wc = WendlerCalc.new(135, "3")
        result = @wc.run
        expected = [["5", 49], ["5", 61], ["5", 92], ["3", 104], ["1+", 116]]
        result.must_equal(expected)	
      end
    end

    describe "when week 4" do
      it "must calc 135 correctly" do
        @wc = WendlerCalc.new(135, "4")
        result = @wc.run
        expected = [["5", 49], ["5", 61], ["5", 61], ["5", 61], ["5", 73]]
        result.must_equal(expected)	
      end
    end
  end
end