class ResolutionRecord < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :resolution 
  attr_accessible :date
  validates :resolution_id, presence: true
  default_scope order: 'resolution_records.created_at DESC' 
end
