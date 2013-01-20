require 'test_helper'

describe JamScriptHighlighter::Line do
  describe '.new' do
    describe 'when passed just a string' do
      it 'should return a line with the text property set to the string' do
        JamScriptHighlighter::Line.new("some text").must_be_kind_of JamScriptHighlighter::Line
        JamScriptHighlighter::Line.new("some text").text.must_equal 'some text'
      end
    end

    describe 'when a second parameter is passed' do
      it 'should return the appropriate subclass with the text property set' do
        JamScriptHighlighter::Line.new("some text", :title).must_be_kind_of JamScriptHighlighter::LineTypes::TitleLine
        JamScriptHighlighter::Line.new("some text", :title).text.must_equal 'some text'

        JamScriptHighlighter::Line.new("some text", :variation).must_be_kind_of JamScriptHighlighter::LineTypes::VariationLine
        JamScriptHighlighter::Line.new("some text", :variation).text.must_equal 'some text'
      end
    end
  end
end