class PointOfInterest < ActiveRecord::Base
  belongs_to :user_id

  validates_presence_of :sponsor_info
  validates_presence_of :artist_info
  validates_presence_of :summary

end
