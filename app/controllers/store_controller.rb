class StoreController < ApplicationController
  # ApplicationController is shutting down access to everything in the app.
  # This whitelists the store controller so that non-authorized users are
  # able to see the store.
  skip_before_action :authorize

  # Cart is now part of the layout sidebar so the store
  # controller needs to set the cart to make it available
  # for the view.
  include CurrentCart
  before_action :set_cart

  def index
    count_visits
    @products = Product.order(:title)
  end

  private

  def count_visits
    if session[:counter]
      session[:counter] += 1
    else
      session[:counter] = 1
    end
  end
end
