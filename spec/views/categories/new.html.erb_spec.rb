require 'spec_helper'

describe "categories/new.html.erb" do
  before(:each) do
    assign(:category, FactoryGirl.build_stubbed(:category, :name => ""))
  end


  it "should show category form" do
    render
    expect(rendered).to have_selector('form') do |form|
      form.should have_selector(:action => categories_path)
      form.should have_selector(:method => "post")
    end
  end

  it "should show category fields" do
    render
    expect(rendered).to have_field("Name")
  end

  # it "should have submit button" do
  #   render
  #   expect(rendered).to have_input.for('input')
  #   end
  # end

end