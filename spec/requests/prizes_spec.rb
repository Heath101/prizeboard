require "spec_helper"
require "pry"

describe "Prizes" do

  before(:each) do
      FactoryGirl.create(:category, name: "Test Category")
  end

  # prizes#new
  describe "new" do
    it "creates a new prize" do
      visit categories_path
      click_link "Test Category"
      click_link "add prize"

    end
  end

  # prizes#create
  describe "create" do
    it "creates and saves a new prize" do
      visit categories_path
      click_link "Test Category"
      click_link "add prize"
      fill_in "title", with: "Mountain Bike"
      fill_in "description", with: "$100 - Rei"
      click_button "Create Prize"
      expect(page).to have_selector("h1", text: "Test Category") #TODO: decouple from view implementation
      expect(page).to have_content("Mountain Bike")
      expect(page).to have_content("$100 - Rei")
    end
  end

  # prizes#edit
  # prizes#update
  describe "GET/POST category/:category_id/prizes/edit" do
    before(:each) do
      FactoryGirl.create(:category_with_prizes, name: "Category 1")
      @category = Category.find_by_name("Category 1")
      @prize1 = @category.prizes.first
    end

    it "edits and updates a prize" do
      visit categories_path
      click_link "Category 1"
      within("div#prize-#{@prize1.id}") { click_link "edit"} #TODO: decouple from view implementation
      fill_in "title", with: "Updated pElement"
      fill_in "description", with: "1,000"
      click_button "Update Prize"
      expect(page).to have_selector("h1", text: "Category 1") #TODO: decouple from view implementation
      expect(page).to have_content("Updated pElement")
      expect(page).to have_content("1,000") #TODO: depends on the value being formatted in the view
    end
  end

  # prizes#destroy
  describe "DELETE category/:category_id/prizes/edit" do
    before(:each) do
      FactoryGirl.create(:category_with_prizes, name: "Category 9")
      @category = Category.find_by_name("Category 9")
      @prize1 = @category.prizes.first
    end

    it "deletes the prize" do
      visit categories_path
      click_link "Category 9"
      within("div#prize-#{@prize1.id}") { click_link 'delete'} #TODO: decouple from view implementation
      expect(page).to have_selector("h1", text: "Category 9") #TODO: decouple from view implementation
      expect(page).not_to have_selector("div#prize-#{@prize1.id}")
    end
  end


end