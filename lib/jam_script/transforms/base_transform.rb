module Transforms
  class BaseTransform < Parslet::Transform
    rule(:text => simple(:text)) { text.to_s }
  end
end