class PointOfInterest < ActiveRecord::Base
  belongs_to :user_id
  has_many :comments, dependent: :destroy

  validates_presence_of :sponsor_info
  validates_presence_of :artist_info
  validates_presence_of :summary

end
