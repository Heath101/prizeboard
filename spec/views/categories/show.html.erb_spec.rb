require 'spec_helper'

describe "categories/show.html.erb" do

  before(:each) do
    @category = assign(:categories, FactoryGirl.build_stubbed(:category, name: "Category 40"))
  end

  it "displays category name" do
    render
    expect(rendered).to have_content("Category 40")
  end

end