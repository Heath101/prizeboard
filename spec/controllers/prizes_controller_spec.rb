require 'spec_helper'

describe PrizesController do
  let(:category_attributes) { FactoryGirl.attributes_for(:category) }

  describe "GET prize/new" do
    it "assigns category from url as @category" do
      category = Category.create! category_attributes
      get :new, {category_id: category.to_param}
      assigns(:category).should eq(category)
    end

    it "assigns a new prize to category"
    it "builds elements for prize"
  end

  describe "POST prize/new" do
    context "with valid data" do

      it "assigns category from url as @category" do
        category = Category.create! category_attributes
        post :new, {category_id: category.to_param}
        assigns(:category).should eq(category)
      end

      it

      it "redirect to category index" do
      end
    end
  end
end
