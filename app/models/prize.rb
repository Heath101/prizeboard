class Prize < ActiveRecord::Base
  attr_accessible :active, :title, :description

  belongs_to :category
  
end