module Spine
  module Transform
    module Syntax
      module Timestamp
        def timestamp(key, options = {})
          register(
            key,
            intercept(key, options) { |value|
              value.is_a?(DateTime) ? value : DateTime.iso8601(value.to_s)
            }
          )
        end
      end
    end
  end
end
