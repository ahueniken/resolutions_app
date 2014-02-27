class ResolutionRecord < ActiveRecord::Base
  # attr_accessible :title, :body
  default_scope order('date DESC')
  belongs_to :resolution 
  attr_accessible :date
  validates :resolution_id, presence: true
end
