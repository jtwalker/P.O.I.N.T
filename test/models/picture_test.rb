require 'test_helper'

class PictureTest < ActiveSupport::TestCase
	test "user is set" do
		assert_equal 1, pictures(:firstpicture).user_id, "user did not match expected"
	end

	test "poi is set" do
		assert_equal 1, pictures(:firstpicture).point_of_interest_id, "poi did not match expected"
	end

	test "main image true is set" do
		assert_equal true, pictures(:firstpicture).main_image, "main image did not match expected"
	end

	test "main image false is set" do
		assert_equal false, pictures(:secondpicture).main_image, "main image did not match expected"
	end
end
