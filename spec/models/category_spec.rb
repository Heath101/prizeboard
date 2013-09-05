require 'spec_helper'

describe Category do

  before { @category = FactoryGirl.create(:category) }
  subject { @category }

  it {should respond_to(:name)}
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}
  
  it {should be_valid}

  it {should have_many(:prizes)}

end
