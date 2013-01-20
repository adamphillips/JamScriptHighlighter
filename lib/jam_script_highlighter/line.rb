module JamScriptHighlighter
  class Line
    attr_accessor :text

    def to_html
      @text || ''
    end

    class << self
      def new text, type=nil
        if type
          class_name = "#{type.to_s.split('_').map{|e| e.capitalize}.join}Line"
          cls = JamScriptHighlighter::LineTypes.const_get(class_name)
          cls.new text
        else
          ret = super
          ret.text = text

          ret
        end
      end
    end
  end
end