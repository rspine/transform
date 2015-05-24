module Spine
  module Transform
    module Syntax
      module Timestamp
        def timestamp(key, options = {})
          register(
            key,
            intercept(key, options) { |value|
              return value if value.is_a?(DateTime)
              DateTime.iso8601(value.to_s)
            }
          )
        end
      end
    end
  end
end
