module Parsers
  module Rules
    module BaseRules
      def self.included base
        base.rule(:comma) { space? >> str(',').repeat(1) >> space? }
        base.rule(:dot) { space? >> str(".").repeat(1) >> space? }
        base.rule(:newline) { space.repeat >> str("\n").repeat(1) }
        base.rule(:slash) { space? >> str("/").repeat(1) >> space? }
        base.rule(:space) { str("\s").repeat(1) }

        base.rule(:comma?) { comma.maybe }
        base.rule(:dot?) { dot.maybe }
        base.rule(:newline?) { newline.maybe }
        base.rule(:slash?) { slash.maybe }
        base.rule(:space?) { space.maybe }

        base.rule(:integer) { match('[0-9]').repeat(1) }
        base.rule(:text) { (newline.absnt? >> any).repeat(1).as(:text) }

        base.rule(:fraction) { integer >> slash >> integer }

        # Control Characters
        base.rule(:section_ctl) { newline >> str("*") >> space? }
        base.rule(:ctrl_char) { section_ctl }
      end
    end
  end
end