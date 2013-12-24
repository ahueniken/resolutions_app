class ResolutionRecord < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :resolution 
  
end
