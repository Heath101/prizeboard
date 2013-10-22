class PrizeboardController < ApplicationController
layout "prizeboard"
  def index
    @categories = Category.includes(:prizes).all
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    @prize = Prize.find(params[:id])
    @prize.toggle(:active)
    if not @prize.save
      render js: ""
    else
      render :update_prize
    end
  end
end
