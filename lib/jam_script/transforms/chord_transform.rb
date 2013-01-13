module Transforms
  class ChordTransform < Parslet::Transform
    rule(
      :modifiers => subtree(:mods),
      :note => simple(:note),
      :length => simple(:length)
    ) { { :modifiers => mods.map {|m| m.keys[0]}, :note => String(note).upcase, :length => String(length) } }

    rule(
      :modifiers => subtree(:mods),
      :note => simple(:note)
    ) { { :modifiers => mods.map {|m| m.keys[0]}, :note => String(note).upcase } }
  end
end