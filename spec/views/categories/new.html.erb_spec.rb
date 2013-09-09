require 'spec_helper'

describe "categories/new.html.erb" do
  before(:each) do
    assign(:category, FactoryGirl.build_stubbed(:category, :name => ""))
    render
  end

  it "should show category form" do
    expect(rendered).to have_selector('form') do |form|
      form.should have_selector(:action => categories_path)
      form.should have_selector(:method => "post")
    end
  end

  it "should show category fields" do
    expect(rendered).to have_field("Name")
  end

  it "should have submit button" do
    expect(rendered).to have_selector('input[type=submit]')
  end

end