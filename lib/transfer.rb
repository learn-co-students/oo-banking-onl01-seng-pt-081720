 class Transfer
  attr_accessor :sender , :receiver , :status , :amount , :balance 

  def initialize(sender, receiver, amount) 
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount 
  end 
  
  def valid? 
    sender.valid? && receiver.valid? 
  end 
  
  def execute_transaction
    if ((self.valid?) && (self.status == "pending") && (self.sender.balance >= self.amount))
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  
 def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  
end  