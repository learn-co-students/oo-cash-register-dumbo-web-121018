
require 'pry'

class CashRegister

  attr_accessor :total, :discount, :quantity, :cart, :last_transaction
  attr_reader :title

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(title, price, quantity = 1)
    @quantity = quantity
    @total += price * quantity
    @title = title
    quantity.times { @cart << title }
    @last_transaction = price * quantity
  end

  def apply_discount
    @total = @total * (100 - @discount) / 100
    @discount != 0 ? "After the discount, the total comes to $#{@total}." : "There is no discount to apply."
  end

  def items
    @cart
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
