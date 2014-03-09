require 'test_helper'

class PointOfInterestTest < ActiveSupport::TestCase
	test "latitude is set" do
		assert_equal 1.5, point_of_interests(:firstpoi).latitude, "latitude did not match expected"
	end

	test "longitude is set" do
		assert_equal 1.5, point_of_interests(:firstpoi).longitude, "longitude did not match expected"
	end

	test "summary is set" do
		assert_equal "MyText", point_of_interests(:firstpoi).summary, "summary did not match expected"
	end

	test "artist info is set" do
		assert_equal "MyText", point_of_interests(:firstpoi).artist_info, "artist info did not match expected"
	end

	test "sponsor info is set" do
		assert_equal "MyText", point_of_interests(:firstpoi).sponsor_info, "sponsor info did not match expected"
	end

	test "user id is set" do
		assert_equal users(:justin), point_of_interests(:firstpoi).user, "user id did not match expected"
	end

	test "should not create poi without latitude" do
		poi = PointOfInterest.new
		poi.longitude = 1
		poi.summary = "blank"
		poi.artist_info = "blank"
		poi.sponsor_info = "blank"
		assert_not poi.save, "Saved the POI without latitude"
	end

	test "should not create poi without longitude" do
		poi = PointOfInterest.new
		poi.latitude = 1
		poi.summary = "blank"
		poi.artist_info = "blank"
		poi.sponsor_info = "blank"
		assert_not poi.save, "Saved the POI without longitude"
	end

	test "should not create poi without summary" do
		poi = PointOfInterest.new
		poi.latitude = 1
		poi.longitude = 1
		poi.artist_info = "blank"
		poi.sponsor_info = "blank"
		assert_not poi.save, "Saved the POI without summary"
	end

	test "should not create poi without artist information" do
		poi = PointOfInterest.new
		poi.latitude = 1
		poi.longitude = 1
		poi.summary = "blank"
		poi.sponsor_info = "blank"
		assert_not poi.save, "Saved the POI without artist information"
	end

	test "should not create poi without sponsor information" do
		poi = PointOfInterest.new
		poi.latitude = 1
		poi.longitude = 1
		poi.summary = "blank"
		poi.artist_info = "blank"
		assert_not poi.save, "Saved the POI without sponsor information"
	end
end
