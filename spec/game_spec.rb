require_relative '../lib/game.rb'

describe Game do
  game = Game.new
  for i in 0...20
    game.roll(0)
  end
  puts game
  describe 'score' do
    it 'returns an integer' do
      expect(game.score).to be_kind_of(Integer)
    end

    it 'returns 0' do
      expect(game.score).to eql(0)
    end
  end
end
