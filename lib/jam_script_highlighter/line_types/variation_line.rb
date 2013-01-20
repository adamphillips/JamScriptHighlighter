module JamScriptHighlighter
  module LineTypes
    class VariationLine < Line
      def to_html
        "<h4 class=\"variation\">#{@text}</h4>"
      end
    end
  end
end