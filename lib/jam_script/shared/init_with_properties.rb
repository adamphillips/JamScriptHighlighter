module Shared
  module InitWithProperties
    def self.included(base)
      base.extend Shared::InitWithProperties::ClassMethods
    end

    module ClassMethods
      def new properties
        properties ||= {}

        result = super

        properties.each do |pkey, pval|
          result.send "#{pkey}=".to_sym, pval
        end

        result
      end
    end

  end
end