class Transfer
  attr_accessor :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount

  end

  def status
    @status
  end

  def amount
    learn
  end

end
