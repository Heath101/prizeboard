require "spec_helper"

describe "Prizeboard Prize" do

  describe "toggling a prize's availability" do
    it "marks prize as inactive" do
      category = FactoryGirl.create(:category_with_prizes, name: "Category 1")
      active_prize = category.prizes.first
      active_prize.active = true
      visit prizeboard_index_path
      click_link category.name
      find(:xpath, "//a[@data-prize-id=#{active_prize.id}]").click
      ## finish this test ##
    end
  end

end