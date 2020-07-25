class CashRegister

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @id = []
  end

  attr_accessor :total, :discount, :items

  def add_item(title, price, quantity=1)
    @id << [price, quantity]
    quantity.times do
      @items << title
    end
    @total += price * quantity
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= (@total / 100.0 * @discount)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total -= (@id[-1][0] * @id[-1][1])
  end

end
