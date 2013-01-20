module JamScriptHighlighter
  module LineTypes
    class SectionLine < Line
      def to_html
        "<h4 class=\"section\">#{@text}</h4>"
      end
    end
  end
end