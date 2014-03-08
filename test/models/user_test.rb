require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "uid is set" do
		assert_equal "00000000002", users(:justin).uid, "Uid did not match expected"
	end

	test "facebook provider is set" do
		assert_equal "facebook", users(:justin).provider, "Facebook provider did not match expected"
	end

	test "google provider is set" do
		assert_equal "google_oauth2", users(:stephen).provider, "Google provider did not match expected"
	end

	test "account type admin is set" do
		assert_equal "ADMIN", users(:justin).account_type, "Account type admin did not match expected"
	end

	test "account type poimanager is set" do
		assert_equal "POIMGR", users(:lacy).account_type, "Account type poimanager did not match expected"
	end

	test "account type standard is set" do
		assert_equal "Standard", users(:gregg).account_type, "Account type standard did not match expected"
	end

	test "name is set" do
		assert_equal "Justin Walker", users(:justin).name, "Name did not match expected"
	end

	test "email is set" do
		assert_equal "jwalke21@my.westga.edu", users(:justin).email, "Email did not match expected"
	end

	test "should not create user without uid" do
		user = User.new
		user.provider = "facebook"
		user.account_type = "ADMIN"
		user.name = "POINT POINT"
		user.email = "noreplypoint@gmail.com"
		assert_not user.save, "Saved the user without a uid"
	end

	test "should not create user without provider" do
		user = User.new
		user.uid = "0000000000"
		user.account_type = "ADMIN"
		user.name = "POINT POINT"
		user.email = "noreplypoint@gmail.com"
		assert_not user.save, "Saved the user without a provider"
	end

	test "should not create user without account_type" do
		user = User.new
		user.uid = "0000000000"
		user.provider = "facebook"
		user.name = "POINT POINT"
		user.email = "noreplypoint@gmail.com"
		assert_not user.save, "Saved the user without a account type"
	end

	test "should not create user without name" do
		user = User.new
		user.uid = "0000000000"
		user.provider = "facebook"
		user.account_type = "ADMIN"
		user.email = "noreplypoint@gmail.com"
		assert_not user.save, "Saved the user without a name"
	end

	test "should not create user without email" do
		user = User.new
		user.uid = "0000000000"
		user.provider = "facebook"
		user.account_type = "ADMIN"
		user.name = "POINT POINT"
		assert_not user.save, "Saved the user without an email"
	end
end
