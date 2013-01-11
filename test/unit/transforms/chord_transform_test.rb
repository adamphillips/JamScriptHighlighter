require 'test_helper'

describe Transforms::ChordTransform do
  describe 'when passed a note and modifier' do
    before do
      @hash = {:note => 'a', :modifiers => []}
    end

    it 'should upper case the note' do
      Transforms::ChordTransform.new.apply(@hash)[:note].must_equal 'A'
    end

    it 'should dehashify the modifier' do
      Transforms::ChordTransform.new.apply(@hash)[:modifiers].must_equal []
      @hash[:modifiers] << {:minor => 'x'}
      Transforms::ChordTransform.new.apply(@hash)[:modifiers].must_equal [:minor]
      @hash[:modifiers] << {:seventh => 'x'}
      Transforms::ChordTransform.new.apply(@hash)[:modifiers].must_equal [:minor, :seventh]
    end

    describe 'and a length' do
      before do
        @hash[:length] = '3'
      end

      it 'should not change' do
        Transforms::ChordTransform.new.apply(@hash)[:length].must_equal '3'
      end
    end
  end

end