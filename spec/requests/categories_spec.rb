require 'spec_helper'

describe "Categories" do
  describe "GET /categories" do
    it "should show Categories" do
      @category = FactoryGirl.create(:category, name: "Category 99")
      visit categories_path
      expect(page).to have_content("Category 99")
    end
  end

  describe "GET /categories/new" do

    it "should show new for" do
      visit new_category_path
      fill_in "Name", with: "Category 55"
      click_button 'submit'
    end
  end

end
