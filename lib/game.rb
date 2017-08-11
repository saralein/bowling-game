class Game

  def initialize
    @rolls = Array.new(20){0}
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def is_spare(frameIndex)
    return @rolls[frameIndex] + @rolls[frameIndex + 1] == 10
  end

  def is_strike(frameIndex)
    return @rolls[frameIndex] == 10
  end

  def spare_bonus(frameIndex)
    return @rolls[frameIndex + 2]
  end

  def strike_bonus(frameIndex)
    return @rolls[frameIndex + 1] + @rolls[frameIndex + 2]
  end

  def frame_score(frameIndex)
    return @rolls[frameIndex] + @rolls[frameIndex + 1]
  end

  def score
    score = 0
    frameIndex = 0
    for frames in 0...10
      if (is_strike(frameIndex))
        score += 10 + strike_bonus(frameIndex)
        frameIndex += 1
      elsif (is_spare(frameIndex))
        score += 10 + spare_bonus(frameIndex)
        frameIndex += 2
      else
        score += frame_score(frameIndex)
        frameIndex += 2
      end
    end
    return score
  end
end
