require 'test_helper'

describe  Chord do
  describe '.new' do
    it 'should initialise the Jam with the specified properties' do
      c = Chord.new(:note => 'A', :modifiers => [:min, :seventh, :flat_5], :length => 2)

      c.note.must_equal 'A'
      c.modifiers.must_equal [:min, :seventh, :flat_5]
      c.length.must_equal 2
    end
  end

end