class Prize < ActiveRecord::Base
  attr_accessible :active, :prize_elements_attributes

  belongs_to :category
  has_many :prize_elements, dependent: :destroy

### not tested
  accepts_nested_attributes_for :prize_elements
###

### not tested
  def name
    name = ""
    self.prize_elements.each do |element|
      name << "$#{element.value} #{element.name} and "
    end
    name[0..-5] #gross
  end
###
end