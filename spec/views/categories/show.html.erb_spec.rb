require 'spec_helper'

describe "categories/show.html.erb" do

  before(:each) do
    @category = assign(:categories, FactoryGirl.build_stubbed(:category, name: "Category 40"))
  end

  it "has edit link" do
    render
    expect(rendered).to have_link('edit', href: edit_category_path(@category))
  end

  it "has delete link" do
    
  end
  it "displays category name" do
    render
    expect(rendered).to have_content("Category 40")
  end

end