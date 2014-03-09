class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :point_of_interest

  validates :body, presence: true,
                    length: { maximum: 140 }
end
