require 'spec_helper'

describe Category do

  before { @category = FactoryGirl.create(:category, name: "ABC") }
  subject { @category }

  it {should respond_to(:name)}
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}
  
  it {should be_valid}

  it {should have_many(:prizes).dependent(:destroy)}

  it "default sort order is alphabetical" do
    third = FactoryGirl.create(:category, name: "XYZ")
    second = FactoryGirl.create(:category, name: "DEF")
    expect(Category.all).to eq [@category,second,third]

  end
end
