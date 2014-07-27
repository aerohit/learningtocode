class Walrus
  attr_reader :energy

  def initialize
    @energy = 0
  end

  def receive_gift!(gift)
    if gift.edible?
      @energy += gift.digest.energy
    end
  end
end

class LifeEvent
  attr_reader :energy
  def initialize(params)
    @energy = params.fetch(:energy)
  end
end

describe Walrus do
  it "gains energy by eating food" do
    cheese = double(:edible? => true,
                    :digest => LifeEvent.new(:energy => 100))
    expect do
      subject.receive_gift!(cheese)
    end.to change { subject.energy }.by 100
  end

  it "ignores non-edible things" do
    shoe = double(:edible? => false)
    expect do
      subject.receive_gift!(shoe)
    end.not_to change { subject.energy }
  end
end
