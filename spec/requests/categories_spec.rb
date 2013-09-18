require "spec_helper"

describe "Categories" do

  #categories#index
  describe "GET /categories" do
    it "should show all Categories" do
      @category = FactoryGirl.create(:category, name: "Category 99")
      visit categories_path
      expect(page).to have_content("Category 99")
    end
  end

  # categories#show
  describe "GET /category/:id" do
    it "should show individual category page" do
      visit new_category_path
      fill_in "Name", with: "My Category"
      click_button "Create Category"
      visit categories_path
      click_link "My Category"
      expect(page).to have_selector("h1", text: "My Category") #TODO: decoupled from view implementation
    end
  end

  # categories#new
  describe "GET /categories/new" do

    it "should show new form" do
      visit new_category_path
      fill_in "Name", with: "Category 55"
    end
  end

  # categories#create
  describe "POST /categories/new" do

    context "with valid data" do
      it "should create a category" do
        visit new_category_path
        fill_in "Name", with: "Category 56"
        click_button "Create Category"
        expect(page).to have_content("Categories Index") #TODO: decoupled from view implementation
        expect(page).to have_content("Category 56")
        expect(page).to have_selector("div.alert-success", text: "Category successfully created")
      end
    end

    context "with invalid data" do
      it "should render new category page" do
        visit new_category_path
        fill_in "Name", with: ""
        click_button "Create Category"
        expect(page).to have_content("New Category") #TODO: decoupled from view implementation

      end

      it "should show list of errors" do
        visit new_category_path
        fill_in "Name", with: ""
        click_button "Create Category"
        expect(page).to have_selector("div.alert-danger")
      end
    end
  end

  # categories#edit
  describe "GET /category/:id/edit" do
    before(:each) do
      visit new_category_path
      fill_in "Name", with: "Category 80"
      click_button "Create Category"
      visit category_path(Category.last)
      click_link "edit"
    end

    it "should show the category form" do
      fill_in "Name", with: "Category 80"       
    end

    it "shows category fields" do
      expect(find_field("Name").value).to eq "Category 80"
    end
  end

  # categories#update
  describe "PUT /category/:id" do

    before(:each) do
      visit new_category_path
      fill_in "Name", with: "Category 83"
      click_button 'Create Category'
      visit edit_category_path(1)
    end

    it "should update category name" do
      fill_in "Name", with: "Category 84"
      click_button "Update Category"
      expect(page).to have_selector("h1", text: "Category 84") #TODO: decoupled from view implementation
    end
  end

  # categories#destroy
  describe "DELETE /category/:id" do
    it "should delete category" do
      visit new_category_path
      fill_in "Name", with: "Category 29"
      click_button "Create Category"
      visit category_path(Category.last)
      click_link "delete"
      expect(page).to have_content("Categories Index") #TODO: decoupled from view implementation
      expect(page).not_to have_content("Category 29")
      expect(page).to have_selector("div.alert-success", text: "Category successfully deleted")
    end

  end
end
