class CashRegister
  attr_accessor :total, :discount, :recent_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    quantity.times {@items << title}
    @recent_transaction = self.total
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total = self.total.to_f * (100 - self.discount)/100
      return "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.recent_transaction
  end
end
