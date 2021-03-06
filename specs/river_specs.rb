require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative("../river")
require_relative("../fish")

class RiverTest < MiniTest::Test

    def setup()
        @fish1 = Fish.new("Nemo")
        @fish2 = Fish.new("Dory")
        @fish3 = Fish.new("Bubbles")
        @river = River.new("Amazon", [@fish1, @fish2, @fish3])
    end

    def test_river_has_name()
        assert_equal("Amazon", @river.name)
    end

    def test_river_has_fishes()
        assert_equal(3, @river.fish_count())
    end

    def test_river_can_lose_fish()
        @river.lose_fish(@fish2)
        assert_equal(2, @river.fish_count())
    end

end