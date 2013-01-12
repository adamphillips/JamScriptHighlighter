module Transforms
  class JamTransform < BaseTransform
    rule(:text => simple(:text)) { text.to_s }

    rule(:title => simple(:tl)) { {:title => tl.to_s} }

    rule(
      :title => simple(:tl),
      :metadata => subtree(:items)
    ) {
      ret = {:title => tl}
      md = {}
      items.each do |itm|
        md[itm.first[0]] = itm.first[1]
      end
      ret[:metadata] = md
      ret
    }
  end
end