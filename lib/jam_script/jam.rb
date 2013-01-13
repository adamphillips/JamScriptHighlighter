class Jam
  include Shared::InitWithProperties

  attr_accessor :title, :metadata, :sections

  class << self
    def from_string string
      tree = Parsers::JamParser.new.parse(string)

      tree = Transforms::JamTransform.new.apply(tree)
      tree = Transforms::ChordTransform.new.apply(tree)
      tree = Transforms::BaseTransform.new.apply(tree)

      tree = Transforms::ClassTransform.new.apply(tree)

      self.new(tree)
    end
  end
end