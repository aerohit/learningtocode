class Game
  attr_reader :current_sticks

  def initialize
    @current_sticks = 15
  end

  def strike(sticks)
    if current_sticks <= sticks
      raise "Only #{current_sticks} sticks on table."
    elsif sticks < 1 or sticks > 3
      raise "Can strike between 1-3 only."
    else
      @current_sticks -= sticks
    end
  end
end
