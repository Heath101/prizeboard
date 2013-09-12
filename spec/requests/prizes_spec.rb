require 'spec_helper'
require "pry"

describe "Prizes" do

  before(:each) do
      FactoryGirl.create(:category, name: "Test Category")
  end

  # prizes#new
  # prizes#create
  describe "GET/POST category/:category_id/prizes/new" do
    it "creates and saves a new prize" do
      visit categories_path
      click_link 'Test Category'
      click_link 'add prize'
      fill_in 'Name', with: 'Mountain Bike'
      fill_in 'Value', with: 100
      click_button 'Create Prize'
      expect(page).to have_selector('h1', text: "Test Category") #TODO: decouple from view implementation
      expect(page).to have_content('Mountain Bike')
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
      original_prize_Name = @prize1.name
      visit categories_path
      click_link 'Category 1'
      within("li#prize-#{@category.id}") { click_link 'edit'} #TODO: decouple from view implementation
      fill_in 'Value', with: 1000
      fill_in 'Name', with: "Updated pElement"
      click_button 'Update Prize'
      expect(page).to have_selector('h1', text: "Category 1") #TODO: decouple from view implementation
      expect(page).to have_content('Updated pElement')
      expect(page).to have_content('1000')
      expect(page).not_to have_content(original_prize_Name)
    end
  end

end