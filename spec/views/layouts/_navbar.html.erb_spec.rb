require "spec_helper"

describe "layouts/_navbar.html.erb" do

  it "should have link to Category index" do
    render
    expect(rendered).to have_link("Categories", categories_path)

  end
end