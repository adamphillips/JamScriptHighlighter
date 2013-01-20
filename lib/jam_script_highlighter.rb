require 'jam_script_highlighter/html'
require 'jam_script_highlighter/line'
require 'jam_script_highlighter/line_types'

module JamScriptHighlighter
  CONTROL = '#'
  NOTE = '!'
  SECTION = '*'
  VARIATION = '-'

  class << self
    def highlight(string)
      @index = 0
      @ctrl_char_set = false

      result = []
      lines = string.split "\n"

      lines.each_with_index do |line, index|
        @index = index
        result << process(line)
      end

      result
    end

    def process line
      type = type_of line
      if [:control, :note, :section, :variation].include?(type)
        line = line[1..line.length].strip
        @ctrl_char_set = true
      elsif type == :empty
        @ctrl_char_set = true
      else
        unless @ctrl_char_set
          type = (@index == 0) ? :title : :metadata
        end
      end

      {:type => type, :line => line}
    end

    def type_of(line)
      return :empty if line.empty?
      case line[0]
      when CONTROL
        :control
      when NOTE
        :note
      when SECTION
        :section
      when VARIATION
        :variation
      else
        :other
      end
    end
  end
end