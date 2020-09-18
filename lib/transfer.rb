require 'pry'
class Transfer
  attr_accessor :sender, :name, :balance, :receiver, :status, :amount 
  
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender 
    @receiver = receiver
    @amount = amount
  end
  
  def valid?
    receiver.valid? && sender.valid?
  end
  
  def execute_transaction
    if valid? && self.status == "pending" && sender.balance > amount 
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if status == "complete"
      sender.balance += amount 
      receiver.balance -= amount
      self.status = "reversed"
    else 
      nil 
    end
  end
  
end
