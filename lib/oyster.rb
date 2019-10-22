class Oystercard

  def top_up(topup)
    raise "Exceeds maximum limit of 90" if @balance + topup > 90
    @balance = @balance + topup
  end

  def limit(topup)
    @balance + topup > 90
  end

  def empty?(duduct)
    @balance = @balance - deduct < 0
  end

end