require "spec_helper"

describe "Prizeboard Prize" do

  describe "toggling a prize's availability" do
    it "marks prize as inactive" do
      category = FactoryGirl.create(:category_with_prizes, name: "Category 1")
      active_prize = category.prizes.first
      active_prize.active = true
      visit prizeboard_path
      click_link "prize-#{active_prize.id}"
      expect(page).to have_css('a#prize-1.inactive')
      expect(current_path).to eq prizeboard_path
    end
  end

end