require 'spec_helper'

describe PrizeElement do

  it {should respond_to(:name)}
  it {should respond_to(:value)}
  
  it {should be_valid}

  it {should belong_to(:prize)}


end