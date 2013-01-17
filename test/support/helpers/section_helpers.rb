module Kernel
  def should_parse_bar text, expectations, &block
    describe "when the text is #{text}" do
      before do
        @bar = Parsers::SectionParser.new.bar
        @text = text
      end

      it 'should parse OK' do
        bar = @bar.parse(@text)[:bar]
        out bar, :yellow
        bar[:chords].wont_be_nil
        bar[:chords].length.must_equal expectations[:notes].length
        bar[:chords].each_with_index do |ch, i|
          chord = ch[:chord]
          chord[:note].must_equal expectations[:notes][i]
          # note the extra array around the expectation
          # avoids unsightly [[]] when using
          chord[:modifiers].must_equal [expectations[:modifiers][i]]
        end
      end

      yield if block_given?
    end
  end
end