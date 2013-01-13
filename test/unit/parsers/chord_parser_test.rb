require 'test_helper'

describe Parsers::ChordParser do
  it 'should parse the note correctly' do
    prsd('a')[:note].to_s.must_equal 'a'
    # proc{ prsd('h') }.must_raise(ChordParseError)
    prsd('G#')[:note].to_s.must_equal 'G#'
    prsd('fb')[:note].to_s.must_equal 'fb'
  end

  it 'should parse modifiers correctly' do
    prsd('a')[:modifiers].must_equal []
    prsd('am')[:note].to_s.must_equal 'a'
    prsd('am')[:modifiers][0][:minor].to_s.must_equal 'm'
    prsd('am7')[:note].to_s.must_equal 'a'
    prsd('am7')[:modifiers][0][:minor].to_s.must_equal 'm'
    prsd('am7')[:modifiers][1][:seventh].to_s.must_equal '7'
  end

  it 'should parse the length correctly' do
    prsd('a.3')[:length].to_s.must_equal '3'
  end

  def prsd(chord)
    prsd = Parsers::ChordParser.new.parse(chord)[:chord]
  end
end