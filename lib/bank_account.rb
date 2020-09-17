require 'pry'
class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000.00
    @status = "open"
  end

  def deposit(dep_amt) # can deposit into it's acct
    self.balance += dep_amt
  end

  def display_balance # can display it's balance
    "Your balance is $#{self.balance}."
  end

  def valid? # valid if open status && bal > 0
    if self.status == "open" && self.balance > 0
      true
    else
      false
    end
  end

  def close_account # can close it's acct
    self.status = "closed"
  end

end
