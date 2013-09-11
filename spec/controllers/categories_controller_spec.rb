require 'spec_helper'

describe CategoriesController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:category) }
  let(:prize_attributes) { FactoryGirl.attributes_for(:prize)}

  describe "GET index" do
    it "assigns all categories as @categories" do
      category = Category.create! valid_attributes
      get :index
      assigns(:categories).should eq([category])
    end
  end

  describe "GET show" do
    it "assigns category to @category" do
      category = Category.create! valid_attributes
      get :show, {:id => category.to_param}
      assigns(:category).should eq(category)
    end

    it "assigns categories prizes to @prizes" do
      category = Category.create! valid_attributes
      prize = category.prizes.create! prize_attributes
      prizes = category.prizes
      get :show, {:id => category.to_param}
      assigns(:prizes).should eq(prizes)
    end
  end

  describe "GET new" do
    it "assigns a new category as @category" do
      get :new
      assigns(:category).should be_a_new(Category)
    end
  end

  describe "POST new" do

    context "with valid data" do

      it "creates a new Category" do
        expect {post :create, {:category => valid_attributes}}
        .to change(Category, :count).by(1)
      end

      it "assigns a newly created category as @category" do
        post :create, {:category => valid_attributes}
        assigns(:category).should be_a(Category)
        assigns(:category).should be_persisted
      end

      it "should redirect to category index with flash message" do
        post :create, {:category => valid_attributes}
        response.should redirect_to(categories_path)
        expect(flash[:success]).not_to be_nil
      end 
    end

    context "with invalid data" do
      before(:each) do
        Category.any_instance.stub(:save).and_return(false)
        post :create, {:category => {name: "invalid"}}
      end

      it "assigns unsaved category to @category" do
        assigns(:category).should be_a_new(Category)
      end

      it {should render_template(:new)}
    end
  end

  describe "GET edit" do
    it "finds and assigns category as @category" do
      category = Category.create! valid_attributes
      get :edit, {id: category.to_param}
      assigns(:category).should eq(category)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested category" do
        category = Category.create! valid_attributes
        Category.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => category.to_param, :category => { "name" => "MyString" }}
      end

      it "assigns the requested category as @category" do
        category = Category.create! valid_attributes
        put :update, {:id => category.to_param, :category => valid_attributes}
        assigns(:category).should eq(category)
      end

      it "redirects to the category with success flash" do
        category = Category.create! valid_attributes
        put :update, {:id => category.to_param, :category => valid_attributes}
        expect(response).to redirect_to(category)
        expect(flash[:success]).not_to be_nil
      end
    end

    describe "with invalid params" do
      it "assigns the category as @category" do
        category = Category.create! valid_attributes
        Category.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.to_param, :category => { "name" => "invalid value" }}
        assigns(:category).should eq(category)
      end

      it "re-renders the 'edit' template" do
        category = Category.create! valid_attributes
        Category.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.to_param, :category => { "name" => "invalid value" }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested category" do
      category = Category.create! valid_attributes
      expect {
        delete :destroy, {:id => category.to_param}
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      category = Category.create! valid_attributes
      delete :destroy, {:id => category.to_param}
      expect(response).to redirect_to(categories_url)
      expect(flash[:success]).not_to be_nil
    end
  end
end
