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

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
