require 'test_helper'

class AccountChangeRequestTest < ActiveSupport::TestCase
	test "user is set" do
		assert_equal 460338185, account_change_requests(:one).user_id, "User_id did not match expected"
	end

	test "account type admin is set" do
		assert_equal "ADMIN", account_change_requests(:one).account_type, "Account_type admin did not match expected"
	end

	test "account type poimgr is set" do
		assert_equal "POIMGR", account_change_requests(:two).account_type, "Account_type poimgr did not match expected"
	end

	test "reason message is set" do
		assert_equal "I WANT IT", account_change_requests(:two).reason_message, "Reason message did not match expected"
	end

	test "should not create request without reason message" do
		request = AccountChangeRequest.new
		request.account_type = "ADMIN"
		assert_not request.save, "Saved the request without a reason message"
	end

	test "should not create request without account type" do
		request = AccountChangeRequest.new
		request.reason_message = "SOMETHING"
		assert_not request.save, "Saved the request without an account type"
	end
end
