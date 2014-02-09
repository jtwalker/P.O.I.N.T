class AccountChangeRequest < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :reason_message
  validates_presence_of :account_type
end
