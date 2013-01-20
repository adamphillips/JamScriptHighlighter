module JamScriptHighlighter
  module LineTypes
    class NoteLine < Line
      def to_html
        "<p class=\"note\">#{@text}</p>"
      end
    end
  end
end