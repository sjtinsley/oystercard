class Oystercard
  LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    if @balance + amount > LIMIT
      fail
    else
      @balance += amount
    end
  end
end
