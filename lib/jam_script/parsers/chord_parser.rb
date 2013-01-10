module Parsers
  class ChordParser < Parslet::Parser
    rule(:accidental) { str('#') | str('b') }
    rule(:note) { match('[a-g]').repeat(1) >> accidental.maybe }

    rule(:minor) { str('m') }
    rule(:diminished) { str('dim') }
    rule(:augmented) { str('aug') | str('+')}
    rule(:seventh) { str('7') }

    rule(:modifier) { minor.as(:minor) | seventh.as(:seventh) | diminished.as(:diminished) | augmented.as(:augmented) }

    rule(:chord) { note.as(:note) >> modifier.repeat.as(:modifier) }

    root :chord
  end
end