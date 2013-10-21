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
    render js: "alert(#{prize.id})"
  end
end
