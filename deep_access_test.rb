require File.expand_path("../deep_access", __FILE__)

class Deep
  class << self
    def very_deep
      "very_deep"
    end
  end
end
# puts Deep.very_deep

class Deeper
  class << self
    class << self
      def very_deeper
        "very_deeper"
      end
    end
  end
end

# class << Deeper
#   puts very_deeper
# end

class Deepest
  class << self
    class << self
      class << self
        def very_deepest
          "very_deepest"
        end
      end
    end
  end
end

class BlackHole
end

require "minitest/autorun"

describe "#deep_access" do
  it "invokes a method in metaclass" do
    Deep.deep_access(:very_deep).must_equal "very_deep"
  end

  it "invokes a method in metaclass of metaclass" do
    Deeper.deep_access(:very_deeper).must_equal "very_deeper"
  end

  it "invokes a method in metaclass of metaclass of metaclass" do
    Deepest.deep_access(:very_deepest).must_equal "very_deepest"
  end

  it "doesn't invoke a non-existing method" do
    BlackHole.deep_access(:infinite).must_equal nil
  end
end
