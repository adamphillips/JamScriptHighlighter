module JamScriptHighlighter
  module Html
    class << self
      def render string, opts={}
        @html = ''
        @section_type = 'chords'

        @processing_metadata = true
        @processing_section = false

        js = JamScriptHighlighter.highlight(string)
        js.each do |line|
          render_line line
        end
        @html += "</div>\n" if @processing_section
        @html += "</div>\n" unless @processing_metadata
        @html
      end

      def render_line line_details
        line = Line.new(line_details[:line], line_details[:type])

        @html += case line_details[:type]
        when :control
          ret = ''
          if @processing_section
            ret += "</div>\n\n"
            @processing_section = false
          end
          ret += line.to_html
          @section_type = line.text.downcase
          ret += "<div class=\"#{@section_type}\">"
          ret
        when :section
          ret = ''
          ret += "</div>\n\n" if @processing_section

          ret += line.to_html
          ret += "<div class=\"#{@section_type}\">"

          @processing_metadata = false
          @processing_section = true

          ret
        else
          line.to_html
        end + "\n"
      end
    end
  end
end