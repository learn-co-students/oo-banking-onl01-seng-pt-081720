class Transfer
  attr_accessor :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end

  def status
    @status
  end

  def amount
    @amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

end
