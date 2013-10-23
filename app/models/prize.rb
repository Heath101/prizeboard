class Prize < ActiveRecord::Base
  attr_accessible :active, :title, :description

  belongs_to :category
  default_scope order('title ASC') 

end