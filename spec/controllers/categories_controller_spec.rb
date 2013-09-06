require 'spec_helper'

describe CategoriesController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:category) }

  describe "GET index" do
    it "assigns all categories as @categories" do
      category = Category.create! valid_attributes
      get :index, {}
      assigns(:categories).should eq([category])
    end
  end

end
