module Parsers
  class JamParser < BaseParser
    include Rules::TimingRules
    include Rules::ChordRules
    include Rules::SectionRules

    rule(:by) { newline >> str('by') >> space >> text.as(:by) }
    rule(:tempo) { newline >> str('tempo') >> space >> text.as(:tempo) }

    rule(:title) { space.repeat >> text.as(:title) }
    rule(:metadata) { (by | tempo).repeat.as(:metadata) }
    rule(:jam) { title >> metadata.maybe >> section.repeat.as(:sections) }

    root(:jam)
  end
end