class Comment < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :point_of_interest
end
