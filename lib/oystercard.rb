class Oystercard
  MINIMUM_BALANCE = 1
  LIMIT = 90
  attr_reader :balance, :journey_state, :minimum_balance

  def initialize
    @balance = 0
    @journey_state = false
  end

  def top_up(amount)
    begin
      raise if @balance + amount > LIMIT
      @balance += amount
    rescue
      "Sorry, this would take the balance over the limit of £#{LIMIT}"
    end
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @journey_state
  end

  def touch_in
    if in_journey?
      begin
        raise
      rescue
        "Sorry, you are already on a journey"
      end
    elsif balance < MINIMUM_BALANCE
      begin
        raise
      rescue
        "Sorry, you do not have the minimum balance to make a journey"
      end
    else
    @journey_state = true
    end
  end

  def touch_out
    begin
      raise unless in_journey?
      @journey_state == true
    rescue
      "Sorry, you are not on a journey"
    end
  end
end
