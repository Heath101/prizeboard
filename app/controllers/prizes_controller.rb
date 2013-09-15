class PrizesController < ApplicationController

  before_filter :get_category, only: [:new,:create,:edit,:update,:destroy]

  def new
    @prize = @category.prizes.build
    @prize.prize_elements.build
  end

  def index
  end


  def create
    @prize = @category.prizes.build(params[:prize])
    if @prize.save
      redirect_to category_path(@category)
    else
      render action: 'new'
    end
  end

  def edit
    @prize = @category.prizes.find(params[:id])
  end

  def update
    ###
    @prize = @category.prizes.find(params[:id])
    if @prize.update_attributes(params[:prize])
      redirect_to category_path(@category)
    else
      render action: 'edit'
    end
    ####
  end

  def destroy
    @prize = @category.prizes.find(params[:id])
    @prize.destroy
    flash[:success] = "Prize successfully deleted"
    redirect_to category_path(@category)
  end

  private
    def get_category
      @category = Category.find(params[:category_id])
    end
end
