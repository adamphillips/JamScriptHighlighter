module Parsers
class ChordParser < BaseParser
    include TimingParser

    rule(:accidental) { str('#') | str('b') }
    rule(:note) { match('[a-gA-G]').repeat(1) }

    rule(:minor) { str('m') }
    rule(:diminished) { str('dim') }
    rule(:augmented) { str('aug') | str('+')}
    rule(:seventh) { str('7') }

    rule(:modifier) { minor.as(:minor) | seventh.as(:seventh) | diminished.as(:diminished) | augmented.as(:augmented) }

    rule(:chord) { note.as(:note) >> accidental.maybe >> modifier.repeat.as(:modifiers) >> length? }

    root :chord
  end
end