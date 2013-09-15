require 'spec_helper'


describe "categories/show.html.erb" do

  before(:each) do
    #TODO replace this with stubbed
    @category = assign(:categories, FactoryGirl.create(:category_with_prizes, name: "Category 40"))
    @prizes = @category.prizes
  end

  describe "category listing" do
    before(:each) { render }
    it "has edit link" do
      expect(rendered).to have_link('edit', href: edit_category_path(@category))
    end

    it "has delete link" do
      #TODO this is not testing path with delete method
      expect(rendered).to have_link('delete', href: category_path(@category)) 
    end

    it "displays category name" do
      expect(rendered).to have_content("Category 40")
    end

    it "has add prize link" do
      expect(rendered).to have_link('add prize', href: new_category_prize_path(@category))
    end
  end

  describe "prize(s) listing" do
    before(:each) do
      @prize = @prizes.first
      render
    end

    it "displays prize names" do
      expect(rendered).to have_content("Prize Element")
    end

    it "has edit link" do
      expect(rendered).to have_link('edit', href: edit_category_prize_path(@category,@prize))
    end

    it "has edit link" do
      expect(rendered).to have_link('delete', href: category_prize_path(@category,@prize))
    end
  end
end