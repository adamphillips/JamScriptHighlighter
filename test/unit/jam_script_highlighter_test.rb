require 'test_helper'

describe  JamScriptHighlighter do
  describe '.highlight' do
    describe 'when passed a single line string' do
      it 'should return an array containing the hash {:type => :title, :line => ...}' do
        h('Some text').must_equal [{:type => :title, :line => 'Some text'}]
      end
    end

    describe 'when passed a multiple line string' do
      it 'should return an array of hashes, 1 for for each line' do
        h("Some text\nby Some one").must_equal [
          {
            :type => :title, 
            :line => 'Some text'
          }, {
            :type => :metadata,
            :line => 'by Some one'
          }
        ]
      end
    end

    describe 'when passed a string containing a section' do
      it 'should return metadata lines until the first control line and type :other' do
        h("Some text\nby Some one\n\n* Verse\nC F | G G").must_equal [
          {
            :type => :title, 
            :line => 'Some text'
          }, {
            :type => :metadata,
            :line => 'by Some one'
          }, {
            :type => :empty,
            :line => ''
          }, {
            :type => :section,
            :line => 'Verse'
          }, {
            :type => :other,
            :line => 'C F | G G'
          }
        ]
      end
    end
  end

  describe '.type_of' do
    describe 'when passed a line that starts with a #' do
      it 'should return :control' do
        JamScriptHighlighter.type_of('# Some line').must_equal :control
      end
    end

    describe 'when passed a line that starts with a !' do
      it 'should return :note' do
        JamScriptHighlighter.type_of('! Some line').must_equal :note
      end
    end

    describe 'when passed a line that starts with a *' do
      it 'should return :section' do
        JamScriptHighlighter.type_of('* Some line').must_equal :section
      end
    end

    describe 'when the line is empty' do
      it 'should return :empty' do
        JamScriptHighlighter.type_of('').must_equal :empty
      end
    end

    describe 'otherwise' do
      it 'should return :other' do
        JamScriptHighlighter.type_of('oeiruqw').must_equal :other
      end
    end
  end

  describe 'repeats?' do

  end
end