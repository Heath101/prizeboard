class CategoriesController < ApplicationController
  def index
    @categories = Category.find(:all)
  end

  def new
    @category = Category.new
  end

end
