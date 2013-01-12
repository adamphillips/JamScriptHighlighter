module Parsers
  class ChordParser < BaseParser
    include Rules::TimingRules
    include Rules::ChordRules

    root :chord
  end
end