require 'spec_helper'

describe "Prizes" do

  before(:each) do
      visit new_category_path
      fill_in "Name", with: "Test Category"
      click_button 'Create Category'
  end

  # prizes#new
  # prizes#create
  describe "GET category/:category_id/prize/:prize_id" do
    it "should show individual prize page" do
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

end