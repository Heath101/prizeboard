class PrizeboardController < ApplicationController
layout "prizeboard"
  def index
    @categories = Category.includes(prizes: [:prize_elements]).all
  end

  def show
    @category = Category.includes(prizes: [:prize_elements]).find(params[:id])
  end
end
