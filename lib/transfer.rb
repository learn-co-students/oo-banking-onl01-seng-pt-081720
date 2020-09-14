class Transfer

  attr_accessor :sender, :receiver, :status, :amount, :last_transaction
  attr_reader

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status == "pending" && @sender.balance > @amount
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end


end
