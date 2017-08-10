require_relative '../lib/game.rb'

describe Game do
  before(:each) do
    @game = Game.new
  end

  def roll_many(n, pins)
    for i in 0...n
      @game.roll(pins)
    end
  end

  describe 'score' do
    it 'returns a score of 0' do
      roll_many(20, 0)
      expect(@game.score).to eql(0)
    end

    it 'returns a score of 20' do
      roll_many(20, 1)
      expect(@game.score).to eql(20)
    end

    it 'returns handles one spare' do
      @game.roll(5)
      @game.roll(5)
      @game.roll(3)
      roll_many(17, 0)
      expect(@game.score).to eql(16)
    end
  end
end
