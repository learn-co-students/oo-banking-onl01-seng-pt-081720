require "pry"

class Transfer
  attr_reader :sender, :receiver, :amount, :reversio
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? == true && self.receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    #binding.pry
    if valid? && sender.balance >= amount
      @sender.balance = (@sender.balance - @amount)
      @receiver.balance += @amount
      @reversio = @amount
      @amount = 0
      self.status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @reversio
      @sender.balance += @reversio
      @status = "reversed"
    end
  end

end
