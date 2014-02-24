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
  }

  include Rails.application.routes.url_helpers

  def make_main(poi_id, picture_id)
    Picture.where(point_of_interest_id: poi_id).each do |picture|
      if picture.id = picture_id
        picture.main_image = true
      else
        picture.main_image = false
      end
      picture.save!
    end
  end

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
