module Spine
  module Transform
    module Commands
      class Transform
        def initialize(key, options = {}, &block)
          @options = options
          @key = options.fetch(:to, key)
          @dsl = block
        end

        def execute(destination, value)
          if @options[:flatten]
            Transformer.new(@dsl).transform(value, destination)
          else
            destination[@key] = Transformer.new(@dsl).transform(value)
          end
        end
      end
    end
  end
end
