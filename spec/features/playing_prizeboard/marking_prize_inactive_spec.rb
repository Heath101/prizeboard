require "spec_helper"

describe "Prizeboard Prize" do

  describe "toggling a prize's availability" do
    it "marks prize as inactive" do
      category = FactoryGirl.create(:category_with_prizes, name: "Category 1")
      active_prize = category.prizes.first
      active_prize.active = true
      visit prizeboard_index_path
      click_link "prize-#{active_prize.id}"
      ## finish this test ##
    end
  end

end