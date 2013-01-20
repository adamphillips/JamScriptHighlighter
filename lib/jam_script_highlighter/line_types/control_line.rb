module JamScriptHighlighter
  module LineTypes
    class ControlLine < Line
      def to_html
        "<h3 class=\"control\">#{@text}</h3>"
      end
    end
  end
end