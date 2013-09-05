require 'spec_helper'

describe Category do

  before { @category = FactoryGirl.create(:category) }
  subject { @category }

  it {should respond_to(:name)}
  it {should respond_to(:available)}
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}
  
  it {should be_valid}



  it "defaults available to true" do
    c = Category.new(name: "Category 2")
    c.save!
    expect(c.available).to be_true
  end

end
