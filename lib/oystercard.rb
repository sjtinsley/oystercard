class Oystercard
  MINIMUM_BALANCE = 1
  LIMIT = 90
  attr_reader :balance
  attr_reader :journey_state

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
    if @journey_state = true
      @journey_state = false
    else
      raise
    end
  end
end
