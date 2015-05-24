module Spine
  module Transform
    module Syntax
      module Decimal
        def decimal(key, options = {})
          register(
            key,
            intercept(key, options) { |value|
              value.is_a?(Float) ? value : Float(value.to_s)
            }
          )
        end
      end
    end
  end
end
