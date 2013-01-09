class Jam
  attr_accessor :title, :key, :tempo, :composer, :time_signature

  class << self
    def new properties
      properties ||= {}

      result = super

      [:title, :key, :tempo, :composer, :time_signature].each do |p|
        result.send "#{p}=".to_sym, properties[p] if properties[p]
      end

      result
    end
  end
end