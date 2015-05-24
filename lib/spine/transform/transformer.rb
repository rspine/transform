module Spine
  module Transform
    class Transformer
      extend Definition

      attr_reader :mapping

      def initialize(dsl)
        @mapping = Mapping.new(dsl)
        @mapping.parse
      end

      def transform(source, destination = {})
        source.reduce(destination) do |result, (key, value)|
          mapping.for(key).execute(result, value)
          result
        end
      end
    end
  end
end
