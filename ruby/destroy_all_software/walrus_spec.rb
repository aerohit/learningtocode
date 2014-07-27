class Walrus
  attr_reader :energy

  def initialize
    @energy = 0
  end

  def receive_gift!(gift)
    if gift.edible?
      @energy += gift.energy
      gift.digest!
    end
  end
end

describe Walrus do
  it "eats food" do
    cheese = double(:edible? => true, :energy => 100)
    expect(cheese).to receive(:digest!)
    subject.receive_gift!(cheese)
  end

  it "gains energy by eating food" do
    cheese = double(:edible? => true, :energy => 100).as_null_object
    expect do
      subject.receive_gift!(cheese)
    end.to change { subject.energy }.by(100)
  end

  it "ignores non-edible things" do
    shoe = double(:edible? => false)
    subject.receive_gift!(shoe)
  end

  it "does not gain energy from non-food" do
    shoe = double(:edible? => false)
    expect do
      subject.receive_gift!(shoe)
    end.not_to change { subject.energy }
  end
end
