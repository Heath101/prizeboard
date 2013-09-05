class Prize < ActiveRecord::Base

  belongs_to :category
  has_many :prize_elements

end