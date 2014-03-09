class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :point_of_interest

  validates :rating, presence: true
end
