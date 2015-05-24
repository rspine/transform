module Spine
  module Transform
    module Syntax
      module Decimal
        def decimal(key, options = {})
          register(
            key,
            intercept(key, options) { |value|
              return value if value.is_a?(Float)
              Float(value.to_s)
            }
          )
        end
      end
    end
  end
end
