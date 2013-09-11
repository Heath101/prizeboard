class PrizeElement < ActiveRecord::Base
  attr_accessible :name, :value
  
  belongs_to :prize

end