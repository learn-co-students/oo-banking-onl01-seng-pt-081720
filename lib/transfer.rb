class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  # attr_reader :name

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
    end

    def valid?
      sender.valid? && receiver.valid?
      #call on valid? method from bank_account class
    end

    def execute_transaction
      if sender.balance > amount && self.valid? && @status != "complete"
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      else sender.balance < amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end

      #sender can only send if they have enough money
      #sender will lose money
      #receive will gain money
      #change status
      #transfer can only happen once???
      #how do we know when a transfer happens?
      #the status is changed
    end

    def reverse_transfer
      if @status == "complete" 
        sender.balance += amount
        receiver.balance -= amount
        @status = "reversed"
      end

      #if we are reversing the transfer
      #we need to do the opposit of above
      #how to we know when a transaction has taken place that we can then reverse?
      #status is changed to complete
    end

end
