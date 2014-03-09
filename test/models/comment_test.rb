require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	test "user id is set" do
		assert_equal 500740463, comments(:firstcomment).user_id, "user id did not match expected"
	end

	test "poi id is set" do
		assert_equal 867678396, comments(:firstcomment).point_of_interest_id, "Uid did not match expected"
	end

	test "comment message is set" do
		assert_equal "MyTextToo", comments(:secondcomment).body, "comment message did not match expected"
	end
end
