class PrizesController < ApplicationController

  before_filter :get_category, only: [:new,:create]

  def new
    @prize = @category.prizes.build
    @prize.prize_elements.build
  end

  def index
  end

  def edit
  end

  def create
    #### not tested in controller (request spec passes)
    @prize = @category.prizes.build(params[:prize])
    ####
    if @prize.save
      redirect_to category_path(@category)
    end
  end

  private
    def get_category
      @category = Category.find(params[:category_id])
    end
end
