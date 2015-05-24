module Spine
  module Transform
    module Syntax
      module Boolean
        FALSES = [nil, 0, false, 'f', 'false', '0'].freeze

        def boolean(key, options = {})
          register(
            key,
            intercept(key, options) { |value| !FALSES.include?(value) }
          )
        end
      end
    end
  end
end
