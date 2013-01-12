module Parsers
  class BaseParser < Parslet::Parser

    rule(:comma) { space? >> str(',').repeat(1) >> space? }
    rule(:dot) { space? >> str(".").repeat(1) >> space? }
    rule(:newline) { space.repeat >> str("\n").repeat(1) }
    rule(:slash) { space? >> str("/").repeat(1) >> space? }
    rule(:space) { str("\s").repeat(1) }

    rule(:comma?) { comma.maybe }
    rule(:dot?) { dot.maybe }
    rule(:newline?) { newline.maybe }
    rule(:slash?) { slash.maybe }
    rule(:space?) { space.maybe }

    rule(:integer) { match('[0-9]').repeat(1) }
    rule(:text) { (newline.absnt? >> any).repeat(1).as(:text) }

    rule(:fraction) { integer >> slash >> integer }

    # Control characters
    rule(:section_ctl) { str("\n*") }
  end
end