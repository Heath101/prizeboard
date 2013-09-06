require 'spec_helper'

describe "categories/index.html.erb" do
  before(:each) do
    @category = assign(:categories, [
        FactoryGirl.build_stubbed(:category, name: "Category 72"),
        FactoryGirl.build_stubbed(:category, name: "Category 73")])
  end

  it "displays categories" do
    render
    expect(rendered).to have_content("Category 72")
    expect(rendered).to have_content("Category 73")
  end

end
