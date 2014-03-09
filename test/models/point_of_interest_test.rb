require 'test_helper'

class PointOfInterestTest < ActiveSupport::TestCase
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
