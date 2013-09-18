require 'spec_helper'
require "pry"

describe "categories/index.html.erb" do
  before(:each) do
    @category = assign(:categories, [
        FactoryGirl.build_stubbed(:category, name: "Category 72"),
        FactoryGirl.build_stubbed(:category, name: "Category 73")])
  end

  it "has add category link" do
    render
    expect(rendered).to have_link("add category", new_category_path)
  end

  describe "category list" do
    before(:each) { render }

    it "displays categories" do
      expect(rendered).to have_content("Category 72")
      expect(rendered).to have_content("Category 73")
    end

    it "category title is a link to show page" do
      expect(rendered).to have_link("Category 72", category_path(72))
    end
  end


end
