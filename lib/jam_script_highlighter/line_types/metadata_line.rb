module JamScriptHighlighter
  module LineTypes
    class MetadataLine < Line
      def to_html
        "<h2 class=\"metadata\">#{@text}</h2>"
      end
    end
  end
end