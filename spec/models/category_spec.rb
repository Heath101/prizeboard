require 'spec_helper'

describe Category do

  before { @category = FactoryGirl.create(:category) }
  subject { @category }

  it {should respond_to(:name)}
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}
  
  it {should be_valid}

  it "default sort order is alphabetical" 
  
  context "associations" do

    it {should have_many(:prizes)}
    it "should destroy prize associations" 

  end

end
