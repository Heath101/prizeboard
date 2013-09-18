class Prize < ActiveRecord::Base
  attr_accessible :active, :prize_elements_attributes

  belongs_to :category
  has_many :prize_elements, dependent: :destroy

### not tested in model (exists in request spec)
  accepts_nested_attributes_for :prize_elements
###

end