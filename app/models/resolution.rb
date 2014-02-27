class Resolution < ActiveRecord::Base
  attr_accessible :name, :frequency
  belongs_to :user
  default_scope order('created_at ASC')
  has_many :resolution_records, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true
end
