module Spine
  module Transform
    module Syntax
      module Integer
        def integer(key, options = {})
          register(
            key,
            intercept(key, options) { |value|
              value.is_a?(Integer) ? value : Integer(value.to_s, 10)
            }
          )
        end
      end
    end
  end
end
