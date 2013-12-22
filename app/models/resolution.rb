class Resolution < ActiveRecord::Base
  attr_accessible :name, :frequency
  belongs_to :user
  validates :user_id, presence: true
end
