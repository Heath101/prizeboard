require 'spec_helper'

describe "categories/edit.html.erb" do

  before(:each) do
    @category = assign(:category, FactoryGirl.build_stubbed(:category, name: "Category 36"))
  end


#TODO not sure this form is tested correctly.
  it "should show category form" do
    render
    assert_select "form[action=?][method=?]", category_path(@category), "post" do
      assert_select "input#category_name[name=?]", "category[name]"
    end
  end

end