require 'spec_helper'

describe Prize do

  it {should belong_to(:category)}
  it {should have_many(:prize_elements).dependent(:destroy)}

end