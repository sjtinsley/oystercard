class Oystercard
  LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    if @balance + amount > LIMIT
      fail "Sorry, this would take the balance over the limit of £#{LIMIT}"
    else
      @balance += amount
    end
  end

  def deduct(amount)
    @balance -= amount
  end

end
