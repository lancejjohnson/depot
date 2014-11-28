class StoreController < ApplicationController
  def index
    increment_counter
    @products = Product.order(:title)
  end

  private

  def increment_counter
    if session[:counter]
      session[:counter] += 1
    else
      session[:counter] = 1
    end
  end
end
