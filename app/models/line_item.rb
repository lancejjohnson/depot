class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def decrement_quantity
    item = self.class.find_by_id(self.id)
    if item.quantity
      if item.quantity > 1
        item.quantity -= 1
      else
        self.destroy
      end
    end
  end
end
