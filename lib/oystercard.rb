class Oystercard
  MINIMUM_BALANCE = 1
  LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
    @journey_state = false
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

  def in_journey?
    @journey_state
  end

  def touch_in
    unless in_journey? or balance < MINIMUM_BALANCE 
      @journey_state = true
    else
      raise
    end
  end

  def touch_out
    @journey_state ? @journey_state = false : raise
  end
end
