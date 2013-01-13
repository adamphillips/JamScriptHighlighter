class Chord
  include Shared::InitWithProperties

  attr_accessor :note, :modifiers, :length

  class << self
    def from_string string
      tree = Parsers::ChordParser.new.parse(string)
      self.new(Transforms::ChordTransform.new.apply(Parsers::ChordParser.new.parse(string))[:chord])
    end
  end
end