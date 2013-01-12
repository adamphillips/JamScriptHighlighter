module Parsers
  class JamParser < BaseParser
    rule(:by) { str('by') >> space >> text.as(:by) >> newline? }
    rule(:tempo) { str('tempo') >> space >> text.as(:tempo) >> newline? }

    rule(:title) { space.repeat >> text.as(:title) >> newline? }

    rule(:jam) { title >> (by | tempo).repeat.as(:metadata) }

    root(:jam)
  end
end