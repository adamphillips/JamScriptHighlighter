module Parsers
  module Rules
    module TimingRules
      def self.included base
        base.rule(:timing) { integer | fraction }
        base.rule(:length) { dot >> timing.as(:length)}
        base.rule(:length?) { length.maybe }
      end
    end
  end
end