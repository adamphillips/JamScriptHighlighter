require 'test_helper'

describe Parsers::ChordParser do
  it 'should parse the note correctly' do
    p = Parsers::ChordParser.new

    p.parse('a')[:note].to_s.must_equal 'a'
    # proc{ p.parse('h') }.must_raise(ChordParseError)
    # p.parse('G#')[:note].to_s.must_equal 'G#'
    # p.parse('fb')[:note].to_s.must_equal 'fb'
  end

  it 'should parse modifiers correctly' do
    p = Parsers::ChordParser.new

    p.parse('a')[:modifier].must_equal []
    p.parse('am')[:note].to_s.must_equal 'a'
    p.parse('am')[:modifier][0][:minor].to_s.must_equal 'm'
    p.parse('am7')[:note].to_s.must_equal 'a'
    p.parse('am7')[:modifier][0][:minor].to_s.must_equal 'm'
    p.parse('am7')[:modifier][1][:seventh].to_s.must_equal '7'
  end
end