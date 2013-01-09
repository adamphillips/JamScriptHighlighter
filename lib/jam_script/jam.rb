class Jam
  include Shared::InitWithProperties

  attr_accessor :title, :key, :tempo, :composer, :time_signature
end