module Parsers
  class BaseParser < Parslet::Parser
    include Rules::BaseRules
  end
end