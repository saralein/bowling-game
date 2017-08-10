require_relative '../lib/game.rb'

describe Game do
  game = Game.new

  def roll_many(n, pins, game)
    for i in 0...n
      game.roll(pins)
    end
  end

  describe 'score' do
    it 'returns an integer' do
      roll_many(20, 0, game)
      expect(game.score).to be_kind_of(Integer)
    end

    it 'returns 20' do
      roll_many(20, 1, game)
      expect(game.score).to eql(20)
    end
  end
end
