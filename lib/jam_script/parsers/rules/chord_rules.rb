module Parsers
  module Rules
    module ChordRules
      def self.included base
        base.rule(:accidental) { str('#') | str('b') }
        base.rule(:note) { match('[a-gA-G]').repeat(1) >> accidental.maybe }

        base.rule(:minor) { str('m') }
        base.rule(:diminished) { str('dim') }
        base.rule(:augmented) { str('aug') | str('+')}
        base.rule(:seventh) { str('7') }

        base.rule(:modifier) { minor.as(:minor) | seventh.as(:seventh) | diminished.as(:diminished) | augmented.as(:augmented) }

        base.rule(:chord) { (note.as(:note) >> modifier.repeat.as(:modifiers) >> length? >> space?).as(:chord) }
      end
    end
  end
end
