class Resolution < ActiveRecord::Base
  attr_accessible :name, :frequency
  belongs_to :user
  has_many :resolution_records, dependent: :destroy
  validates :user_id, presence: true
end
