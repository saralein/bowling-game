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

  def roll_spare
    @game.roll(5)
    @game.roll(5)
  end

  def roll_strike
    @game.roll(10)
  end

  describe 'is_spare' do
    it 'returns true if frame is spare' do
      roll_spare
      expect(@game.is_spare(0)).to eql(true)
    end

    it 'returns false if frame is not spare' do
      @game.roll(5)
      @game.roll(4)
      expect(@game.is_spare(0)).to eql(false)
    end
  end

  describe 'is_strike' do
    it 'returns true if frame is strike' do
      roll_strike
      expect(@game.is_strike(0)).to eql(true)
    end

    it 'returns false if frame is strike' do
      roll_spare
      expect(@game.is_strike(0)).to eql(false)
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

    it 'handles one spare' do
      roll_spare
      @game.roll(3)
      roll_many(17, 0)
      expect(@game.score).to eql(16)
    end

    it 'handles one strike' do
      @game.roll(10)
      @game.roll(3)
      @game.roll(4)
      roll_many(16, 0)
      expect(@game.score).to eql(24)
    end

    it 'correctly scores a perfect game' do
      roll_many(12, 10)
      expect(@game.score).to eql(300)
    end
  end
end
