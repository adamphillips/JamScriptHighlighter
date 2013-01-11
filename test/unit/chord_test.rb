require 'test_helper'

describe  Chord do
  describe '.new' do
    it 'should initialise the Jam with the specified properties' do
      c = Chord.new(:note => 'A', :modifiers => [:min, :seventh, :flat_5], :length => '2')

      c.note.must_equal 'A'
      c.modifiers.must_equal [:min, :seventh, :flat_5]
      c.length.must_equal '2'
    end
  end

  describe '.from_string' do
    describe 'when the string is a valid chord definition' do
      it 'should return a Chord with the note specified' do
        Chord.from_string('a').note.must_equal 'A'
      end

      describe 'when modifiers are passed' do
        it 'should set the appropriate flags' do
          Chord.from_string('am').modifiers.must_equal [:minor]
          Chord.from_string('a7').modifiers.must_equal [:seventh]
          Chord.from_string('am7').modifiers.must_equal [:minor, :seventh]
        end
      end

      describe 'when a length is passed' do
        it 'should set the length' do
          Chord.from_string('a.3').length.must_equal '3'
        end
      end
    end
  end

end