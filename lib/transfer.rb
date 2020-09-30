class Transfer
  attr_accessor :bank_account, :status, :amount
  attr_reader :sender, :receiver
  
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
    if sender.balance > @amount && valid? && status == "pending"   
      receiver.balance += @amount
       sender.balance -= @amount
      @status = "complete"
    elsif @status =="complete"
      "Transaction already complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
   if execute_transaction
     receiver.balance -= @amount
     sender.balance += @amount
     @status = "reversed"
    end
  end
end
