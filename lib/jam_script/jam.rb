class Jam
  include Shared::InitWithProperties

  attr_accessor :title, :metadata

  class << self
    def from_string string
      tree = Parsers::JamParser.new.parse(string)
      self.new(Transforms::JamTransform.new.apply(Parsers::JamParser.new.parse(string)))
    end
  end
end