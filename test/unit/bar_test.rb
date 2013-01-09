require 'test_helper'

describe  Bar do
  describe '.new' do
    it 'should initialise the Bar with the specified properties' do
      b = Bar.new(:chords => [:chord_1, :chord_2])

      b.chords.must_equal [:chord_1, :chord_2]
    end
  end

end