# require 'bundler/setup'
# Bundler.require

class Game
  def initialize
    @score = 0
    @rolls = Array.new(20){}
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    for i in 0...20
      @score += @rolls[i]
      if(i.odd?)
        if (@rolls[i - 1] + @rolls[i] == 10)
          @score += @rolls[i + 1]
        end
      end
    end
    return @score
  end
end
