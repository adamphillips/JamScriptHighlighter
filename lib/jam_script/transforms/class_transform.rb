module Transforms
  class ClassTransform < Parslet::Transform
    rule(:chord => subtree(:chord)) { Chord.new(chord) }
    rule(:bar => subtree(:bar)) { Bar.new(bar) }
    rule(:section => subtree(:section)) { Section.new(section) }
  end
end