class Oystercard
<<<<<<< HEAD

  def top_up(topup)
    raise "Exceeds maximum limit of 90" if @balance + topup > 90
=======
  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(topup)
    fail "Maximum limit £#{MAXIMUM_BALANCE} exceeded" if limit(topup)
>>>>>>> cd62d6549aa3a1e62293ebe07a97e2e202b3139e
    @balance = @balance + topup
  end

  def limit(topup)
<<<<<<< HEAD
    @balance + topup > 90
  end

  def empty?(duduct)
    @balance = @balance - deduct < 0
  end

end
=======
    @balance + topup > MAXIMUM_BALANCE
  end
end
>>>>>>> cd62d6549aa3a1e62293ebe07a97e2e202b3139e
