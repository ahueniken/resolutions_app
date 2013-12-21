class Resolution < ActiveRecord::Base
  attr_accessible :name, :frequency
  belongs_to :user
end
