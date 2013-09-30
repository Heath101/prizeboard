class PrizeboardController < ApplicationController
layout "prizeboard"
  def show
    @categories = Category.all
  end
end
