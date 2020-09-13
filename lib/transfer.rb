# reject a transfer if the accounts aren't valid or if the sender doesnt have tthe money
# start as "pending" status
# can execute and go to "complete" status
# can also go to "reject" status
# can go to a "reversed"status

require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else 
      false
  end
end

def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
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
