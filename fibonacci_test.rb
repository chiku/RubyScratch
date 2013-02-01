require "minitest/autorun"

require File.expand_path("../fibonacci", __FILE__)

describe "Fibonacci" do
  let(:series) { Fibonacci.new }

  describe "#next" do
    it "gives the next fibonacci number in sequence" do
      series.next { |n| n.must_equal 1 }[:item_number].must_equal 1
      series.next { |n| n.must_equal 1 }[:item_number].must_equal 2
      series.next { |n| n.must_equal 2 }[:item_number].must_equal 3
      series.next { |n| n.must_equal 3 }[:item_number].must_equal 4
      series.next { |n| n.must_equal 5 }[:item_number].must_equal 5
      series.next { |n| n.must_equal 8 }[:item_number].must_equal 6
      series.next { |n| n.must_equal 13 }[:item_number].must_equal 7
    end
  end
end
