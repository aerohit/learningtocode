require_relative 'game.rb'

describe Game do
  it 'should start with 15 sticks' do
    g = Game.new
    expect(g.current_sticks).to eq 15
  end

  describe '#strike' do
    it 'can not strike less than 1 stick' do
      g = Game.new
      expect{ g.strike(0) }.to raise_error(RuntimeError, "Can strike between 1-3 only.")
    end

    it 'can not strike more than 3 sticks' do
      g = Game.new
      expect{ g.strike(4) }.to raise_error(RuntimeError, "Can strike between 1-3 only.")
    end

    it 'can strike between 1 and 3 sticks' do
      g = Game.new
      expect(g.strike(2)).to eq 13
      expect(g.current_sticks).to eq 13
    end

    it 'can not strike more than available sticks' do
      g = Game.new
      g.strike(3)
      g.strike(3)
      g.strike(3)
      g.strike(3)
      expect{ g.strike(3) }.to raise_error(RuntimeError, "Only 3 sticks on table.")
    end
  end
end
