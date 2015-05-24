module Spine
  module Transform
    module Commands
      class Intercept
        def initialize(key, action, options = {})
          @key = options.fetch(:to, key)
          @action = action
        end

        def execute(destination, value)
          destination[@key] = @action.call(value)
        end
      end
    end
  end
end
