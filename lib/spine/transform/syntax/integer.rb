module Spine
  module Transform
    module Syntax
      module Integer
        def integer(key, options = {})
          register(
            key,
            intercept(key, options) { |value|
              return value if value.is_a?(Integer)
              Integer(value.to_s, 10)
            }
          )
        end
      end
    end
  end
end
