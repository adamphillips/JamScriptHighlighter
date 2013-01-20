module JamScriptHighlighter
  module LineTypes
    class MetadataLine < Line
      def to_html
        "<h2>#{@text}</h2>"
      end
    end
  end
end