require 'test_helper'

describe Section do
  describe '.new' do
    it 'should initialise the Section with the specified properties' do
      s = Section.new(:bars => [:bar_1, :bar_2])

      s.bars.must_equal [:bar_1, :bar_2]
    end
  end

end