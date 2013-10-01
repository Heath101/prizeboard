class PrizeboardController < ApplicationController
layout "prizeboard"
  def index
    @categories = Category.all
  end

end
