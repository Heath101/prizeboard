require 'spec_helper'

describe Prize do

  it {should belong_to(:category)}
  it {should have_many(:prize_elements)}

  describe "associations" do
    it "should destroy prize element associations" 
  end
end