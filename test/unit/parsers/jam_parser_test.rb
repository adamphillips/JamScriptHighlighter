require 'test_helper'

describe Parsers::JamParser do
  describe 'with a title' do
    before do
      @jam = " A Jam"
    end

    it 'should find the title' do
      jp.parse(@jam)[:title].must_equal(:text => 'A Jam')
    end

    describe 'when there is meta data' do
      it 'should find the meta data' do
        @jam += "\nby Some one"
        jp.parse(@jam)[:metadata][0][:by].must_equal(:text => 'Some one')
        @jam += "\ntempo 100bpm"
        jp.parse(@jam)[:metadata][1][:tempo].must_equal(:text => '100bpm')
      end
    end
  end

  def jp
    Parsers::JamParser.new
  end
end