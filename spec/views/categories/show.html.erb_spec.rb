require 'spec_helper'


describe "categories/show.html.erb" do

  before(:each) do
    #TODO replace this with stubbed
    @category = assign(:categories, FactoryGirl.create(:category_with_prizes, name: "Category 40"))
    @prizes = @category.prizes
  end

  describe "category listing" do
    it "has edit link" do
      render
      expect(rendered).to have_link('edit', href: edit_category_path(@category))
    end

    it "has delete link" do
      render
      expect(rendered).to have_link('delete', href: category_path(@category)) #TODO this is not testing path with delete method
    end

    it "displays category name" do
      render
      expect(rendered).to have_content("Category 40")
    end
  end

  describe "prize(s) listing" do

    #TODO test for multiple prizes
    it "displays prize names" do
      render
      expect(rendered).to have_content("Prize Element")
    end
    
    it "has add prize link" do
      render
      expect(rendered).to have_link('add prize', href: new_category_prize_path(@category))
    end
  end
end