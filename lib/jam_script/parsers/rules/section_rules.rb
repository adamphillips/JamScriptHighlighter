module Parsers
  module Rules
    module SectionRules
      def self.included base
        base.rule(:barline) { str('|') }
        base.rule(:bar) { ((newline | barline) >> space? >> chord.repeat.as(:chords)).as(:bar) }
        base.rule(:section_title) { section_ctl >> text.as(:title) >> space.repeat }
        base.rule(:section) { (section_title >> bar.repeat.as(:bars)).as(:section) }
      end
    end
  end
end