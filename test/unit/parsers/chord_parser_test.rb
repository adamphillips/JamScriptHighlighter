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

    p.parse('a')[:modifiers].must_equal []
    p.parse('am')[:note].to_s.must_equal 'a'
    p.parse('am')[:modifiers][0][:minor].to_s.must_equal 'm'
    p.parse('am7')[:note].to_s.must_equal 'a'
    p.parse('am7')[:modifiers][0][:minor].to_s.must_equal 'm'
    p.parse('am7')[:modifiers][1][:seventh].to_s.must_equal '7'
  end

  it 'should parse the length correctly' do
    p = Parsers::ChordParser.new
    p.parse('a.3')[:length].to_s.must_equal '3'
  end
end