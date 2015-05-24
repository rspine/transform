module Spine
  module Transform
    module Commands
      class Copy
        def initialize(key, options = {})
          @key = options.fetch(:to, key)
        end

        def execute(destination, value)
          destination[@key] = value
        end
      end
    end
  end
end
