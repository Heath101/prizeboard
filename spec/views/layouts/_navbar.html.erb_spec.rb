require "spec_helper"

describe "layouts/_navbar.html.erb" do

  it "should have link to Category index" do
    render
    expect(rendered).to have_link("Categories", categories_path)
  end
  it "should have link to Play Prizeboard" do
    render
    expect(rendered).to have_link("Play Prizeboard", '/prizeboard')
  end
end