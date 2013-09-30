class Prize < ActiveRecord::Base
  attr_accessible :active, :prize_elements_attributes

  belongs_to :category
  has_many :prize_elements, dependent: :destroy

  accepts_nested_attributes_for :prize_elements, reject_if: lambda { |a| a[:name].blank?},
    allow_destroy: true

  def name
    name = ""
    self.prize_elements.each do |pe|
      name << "$#{pe.value.to_i} - #{pe.name}\n"
    end
    name.chomp
  end
  
end