module Parsers
  class BaseParser < Parslet::Parser
    rule(:dot) { match('\.') }
    rule(:slash) { match('/') }

    rule(:integer) {match('[0-9]').repeat(1)}

    rule(:fraction) { integer >> slash >> integer }
  end
end