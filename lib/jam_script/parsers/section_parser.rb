module Parsers
  class SectionParser < BaseParser
    include Rules::TimingRules
    include Rules::ChordRules
    include Rules::SectionRules

    root(:section)
  end
end