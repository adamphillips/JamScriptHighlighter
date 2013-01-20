module JamScriptHighlighter
  module LineTypes
    class TitleLine < Line
      def to_html
        "<h1>#{@text}</h1>"
      end
    end
  end
end