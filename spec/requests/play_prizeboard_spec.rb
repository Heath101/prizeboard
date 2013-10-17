require "spec_helper"

describe "Play Prizeboard" do
  before(:each) do    
    @category = FactoryGirl.create(:category_with_prizes, name: "Category 1")
    @category2 = FactoryGirl.create(:category_with_prizes, name: "Category 2")
    visit prizeboard_index_path
  end

  it "shows categories" do
    expect(page).to have_content(@category.name)
    expect(page).to have_content(@category2.name)
  end

  it "shows summary of each prize" do

  end
end