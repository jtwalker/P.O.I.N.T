require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	test "user id is set" do
		assert_equal users(:justin), comments(:firstcomment).user, "user did not match expected"
	end

	test "poi id is set" do
		assert_equal point_of_interests(:firstpoi), comments(:firstcomment).point_of_interest, "poi did not match expected"
	end

	test "comment message is set" do
		assert_equal "MyTextToo", comments(:secondcomment).body, "comment message did not match expected"
	end
end
