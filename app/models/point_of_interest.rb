class PointOfInterest < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :ratings, dependent: :destroy
  
  accepts_nested_attributes_for :pictures, :allow_destroy => true

  validates_presence_of :sponsor_info
  validates_presence_of :artist_info
  validates_presence_of :summary

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
end
