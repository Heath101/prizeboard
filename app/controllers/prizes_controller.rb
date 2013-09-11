class PrizesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    ### not tested
    @prize = @category.prizes.build
    @prize.prize_elements.build
    ### not tested
  end

  def index
  end

  def edit
  end

  def create
    @category = Category.find(params[:category_id])
    ### not tested
    @prize = @category.prizes.build(params[:prize])
    if @prize.save
      redirect_to category_path(@category)
    end
    ### not tested
  end
end
