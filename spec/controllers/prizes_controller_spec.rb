require 'spec_helper'
require 'pry'

describe PrizesController do
  let(:category_attributes) { FactoryGirl.attributes_for(:category) }
  let(:prize_attributes) { FactoryGirl.attributes_for(:prize)}
  let(:prize_element_attributes) {FactoryGirl.attributes_for(:prize_element)}

  describe "GET prize/new" do
    it "assigns category from url as @category" do
      category = Category.create! category_attributes
      get :new, {category_id: category.to_param}
      assigns(:category).should eq(category)
    end

    it "assigns a new prize to category" do
      category = Category.create! category_attributes
      get :new, {category_id: category.to_param}
      assigns(:prize).should be_a_new(Prize)
      assigns(:prize).should_not be_persisted
    end

    it "builds elements for prize" do
      category = Category.create! category_attributes
      get :new, {category_id: category.to_param}
      assigns(:prize).prize_elements.should_not be_empty
    end
  end

  describe "POST prize/new" do
    context "with valid data" do


      it "creates a new prize" do
        category = Category.create! category_attributes
        expect do
          post :create, {
            category_id: category.to_param, 
            prize: FactoryGirl.attributes_for(:prize_with_elements)}
        end
        .to change(Prize, :count).by(1)
      end

      it "assigns category from url as @category" do
        category = Category.create! category_attributes
        post :create, {category_id: category.to_param}
        assigns(:category).should eq(category)
      end

      # it "assigns newly created prize as @prize" do
      #   category = Category.create! category_attributes
      #   post :new, {category_id: category.to_param}
      #   assigns(:prize).should 

      # end

      it "redirect to category index" do
        category = Category.create! category_attributes
        post :create, {category_id: category.to_param}
        response.should redirect_to(category_path(category))
      end
    end
  end
end
