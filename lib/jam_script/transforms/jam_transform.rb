module Transforms
  class JamTransform < Parslet::Transform
    rule(:title => simple(:tl)) { {:title => tl.to_s} }

    rule(
      :title => subtree(:title),
      :metadata => subtree(:metadata)
    ) {
      md = {}
      metadata.each do |itm|
        md[itm.first[0]] = itm.first[1]
      end
      {:title => title, :metadata => Transforms::JamTransform.process_metadata(md)}
    }

    rule(
      :title => subtree(:title),
      :metadata => subtree(:md),
      :sections => subtree(:sections)
    ) {
      {:title => title, :metadata => Transforms::JamTransform.process_metadata(md), :sections => Transforms::JamTransform.process_sections(sections)}
    }

    def self.process_metadata metadata
      md = {}
      metadata.each do |itm|
        md[itm.first[0]] = itm.first[1]
      end
      md
    end

    def self.process_sections sections
      s = {}
      sections.each do |itm|
        s[itm[:section][:title][:text].to_s || itm[:section][:title].to_s] = itm
      end
      s
    end

  end
end