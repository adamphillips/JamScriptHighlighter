require 'test_helper'

describe Parsers::SectionParser do
  describe 'with a title' do
    before do
      @section = "\n* A section"
    end

    it 'should find the title' do
      prsd[:title].must_equal(:text => 'A section')
    end

    describe 'with chords in bars' do
      before do
        @section += "\n C F | G G7"
      end

      it 'should find the bars' do
        prsd[:bars].length.must_equal 2
      end

      it 'should find the chords' do
        prsd[:bars][0][:bar][:chords][0][:chord][:note].to_s.must_equal 'C'
        prsd[:bars][1][:bar][:chords][1][:chord][:note].to_s.must_equal 'G'
      end
    end
  end

  def sp
    Parsers::SectionParser.new
  end

  def prsd
    sp.parse(@section)[:section]
  end
end