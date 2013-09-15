require 'spec_helper'
require 'pry'

describe PrizesController do
  let(:category_attributes) { FactoryGirl.attributes_for(:category) }
  let(:prize_attributes) { FactoryGirl.attributes_for(:prize)}
  let(:prize_with_elements_attributes) { FactoryGirl.attributes_for(:prize_with_elements)}

  #GET categories/:category_id/prizes/new
  describe "new" do
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

  #POST categories/:category_id/prizes
  describe "create" do
    let(:category) {category = Category.create! category_attributes }
    
    context "with valid prize data" do
      it "creates a new prize" do
        expect do
          post :create, {
            category_id: category.to_param, 
            prize: prize_with_elements_attributes}
        end.to change(Prize, :count).by(1)
      end

      it "assigns category from params as @category" do
        post :create, {category_id: category.to_param}
        assigns(:category).should eq(category)
      end

      it "assigns newly created prize as @prize" do
        prize = category.prizes.build prize_with_elements_attributes
        post :create, {category_id: category.to_param, prize: prize}
        assigns(:prize).should be_a(Prize)
        assigns(:prize).should be_persisted
      end

      it "redirect to category index" do
        post :create, {category_id: category.to_param}
        response.should redirect_to(category_path(category))
      end
    end

    context "with invalid prize data" do
      before(:each) do
        Prize.any_instance.stub(:save).and_return(false)
      end

      it "does not create prize" do
        expect do
          post :create, { category_id: category.to_param, prize: prize_with_elements_attributes}
        end.not_to change(Prize, :count).by(1)
      end

      it "assigns unsaved prize to @prize" do
        prize = category.prizes.build prize_with_elements_attributes
        post :create, {category_id: category.to_param, prize: prize}
        assigns(:prize).should be_a(Prize)
        assigns(:prize).should_not be_persisted
      end

      it "should render new template" do
        post :create, { category_id: category.to_param, prize: prize_with_elements_attributes}
        response.should render_template(:new)
      end
    end
  end

  #GET categories/:category_id/prizes/:id/edit
  describe "edit" do
    it "assigns category from url as @category" do
      category = FactoryGirl.create(:category_with_prizes)
      prize = category.prizes.first
      get :edit,  {category_id: category.id, id: prize.id}
      assigns(:category).should eq(category)
    end

    it "assigns prize as @prize" do
      category = FactoryGirl.create(:category_with_prizes)
      prize = category.prizes.first
      get :edit,  {category_id: category.id, id: prize.id}
      assigns(:prize).should eq(prize)
    end
  end

  #PUT categories/:category_id/prizes/
  describe "update" do
  end

end
