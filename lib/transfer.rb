class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :bankaccount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid? 
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction #transaction executes if status is "pending", valid? method evaluates to true and sender has a positive amount left in the account after the transaction
    if @status == "pending" && self.valid? && @sender.balance - @amount > 0
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && @receiver.balance - @amount > 0 && self.valid?
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    else
      "this is not a valid reversal"
    end
  end

end
