class CashRegister
  attr_accessor :total, :items, :discount, :transactions

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = {}
  end

  def add_item(title, price, quantity = 1)
    quantity.times { self.items << title }
    self.transactions[title] = quantity * price
    self.total += quantity * price
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
      self.total = self.total - self.total * self.discount / 100.00
      return "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total -= self.transactions[self.items[-1]]
  end
end
