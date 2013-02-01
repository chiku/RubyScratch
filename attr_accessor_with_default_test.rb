require 'minitest/autorun'

require File.expand_path('../attr_accessor_with_default', __FILE__)

class TestOne
  attr_accessor_with_default :foo, 100
  attr_accessor_with_default :bar, 200
end

class TestTwo
  attr_accessor_with_default :foo, 1000
  attr_accessor_with_default :bar, 2000
end

describe "attr_accessor_with_defaults" do
  let(:one) { TestOne.new }
  let(:two) { TestTwo.new }

  it "creates objects with the specified default value" do
    one.foo.must_equal 100
  end

  it "allows the value to be modified" do
    one.foo = 200
    one.foo.must_equal 200
  end

  it "allows multiple defaults" do
    one.bar.must_equal 200
  end

  it "doesn't leak default values to another class" do
    one.foo.must_equal 100
    two.foo.must_equal 1000
  end

  it "doesn't leak values being set to other variables in the same class" do
    one.foo = -100
    one.bar.must_equal 200
  end

  it "doesn't leak values being set to another class" do
    one.foo = -100
    two.foo.must_equal 1000
  end
end

# describe "attr_accessor_with_defaults" do
#   it "creates objects with the specified default value" do
#     TestOne.new.foo.must_equal 100
#   end
#
#   it "allows the value to be modified" do
#     one = TestOne.new
#     one.foo = 200
#     one.foo.must_equal 200
#   end
#
#   it "allows multiple defaults" do
#     TestOne.new.bar.must_equal 200
#   end
#
#   it "doesn't leak default values to another class" do
#     TestOne.new.foo.must_equal 100
#     TestTwo.new.foo.must_equal 1000
#   end
#
#   it "doesn't leak values being set to other variables in the same class" do
#     one = TestOne.new
#     one.foo = -100
#     one.bar.must_equal 200
#   end
#
#   it "doesn't leak values being set to another class" do
#     one = TestOne.new
#     two = TestTwo.new
#     one.foo = -100
#     two.foo.must_equal 1000
#   end
# end
