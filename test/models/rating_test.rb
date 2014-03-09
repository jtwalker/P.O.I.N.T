require 'test_helper'

class RatingTest < ActiveSupport::TestCase
	test "user is set" do
		assert_equal users(:stephen), ratings(:secondrating).user, "user did not match expected"
	end

	test "poi is set" do
		assert_equal point_of_interests(:firstpoi), ratings(:firstrating).point_of_interest, "POI did not match expected"
	end

	test "first rating is set" do
		assert_equal 5, ratings(:firstrating).rating, "First rating did not match expected"
	end

	test "second rating is set" do
		assert_equal 1, ratings(:secondrating).rating, "Second rating did not match expected"
	end
end
