class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :point_of_interest
  
  has_one :user
  has_one :point_of_interest
  
  accepts_nested_attributes_for :user, :point_of_interest, :allow_destroy => true
  
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, :default_url => "/images/default_image.png"

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
