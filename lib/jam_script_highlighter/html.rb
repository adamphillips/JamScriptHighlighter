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

      def render_line line
        @html += case line[:type]
        when :title
          title = line[:line]
          "<h1>#{line[:line]}</h1>"
        when :metadata
          "<h2>#{line[:line]}</h2>"
        when :control
          ret = ''
          if @processing_section
            ret += "</div>\n\n"
            @processing_section = false
          end
          ret += "<h3 class=\"control\">#{line[:line]}</h3>\n"
          @section_type = line[:line].downcase
          ret += "<div class=\"#{@section_type}\">"
          ret

        when :section
          ret = ''
          ret += "</div>\n\n" if @processing_section

          ret += "<h4 class=\"section\">#{line[:line]}</h4>\n"
          ret += "<div class=\"#{@section_type}\">"

          @processing_metadata = false
          @processing_section = true

          ret
        when :variation
          "<h4 class=\"variation\">#{line[:line]}</h4>"
        when :note
          "<p class=\"note\">#{line[:line]}</p>"
        when :other
          "<p>#{line[:line]}</p>"
        else
          line[:line] || ''
        end + "\n"
      end
    end
  end
end