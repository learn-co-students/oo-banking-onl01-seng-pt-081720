require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid? # valid if both accts = "open"/calls on sender/receiver's valid methods
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction # executes successful tx between 2 accts, each transfer can only happen once, reject transfer if sender does not have enough funds; bal <= transfer_amt
    if sender.balance > amount && self.valid? && self.status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer # can reverse transfer between 2 accts, it can only reverse executed transfers
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end

end
