require 'test_helper'

class CartTest < ActiveSupport::TestCase
  setup do
    @cart = Cart.new
  end

  test 'increments the quantity of existing line item' do
    @cart.add_product(1)
  end
end
