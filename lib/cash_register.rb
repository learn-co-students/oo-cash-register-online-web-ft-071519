require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction
  
  
  
  def initialize(employee_discount=0)
    @total = 0.0
    @discount = employee_discount
    @items = []
    # binding.pry
  end
  
  def add_item(item, price, quantity=1)
    self.total += (price * quantity)
    quantity.times {@items << item}
    self.last_transaction = price * quantity
  end
  
  def apply_discount
    percent_discount = (discount / 100.0)
    self.total -= (total * percent_discount) if discount != 0
    return "There is no discount to apply." if discount == 0
    "After the discount, the total comes to $#{self.total.to_i}."
    # binding.pry
  end
  
  def void_last_transaction
    self.total -= last_transaction
  end
  
end
