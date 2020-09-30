class BankAccount
  attr_accessor :balance, :status
  attr_reader :name #account holder responsible for bank account
  
  def initialize(name, balance = 1000, status = "open")
    @name = name  
    @balance = balance
    @status = status
  end 
  
  def deposit (money_amt)
    @balance += money_amt
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
   @status == "open" && @balance > 0  #returns false if this statment is not true
  end
  
  def close_account
    @status = "closed"
  end
  
end
