module Spine
  module Transform
    module Syntax
      module Date
        def date(key, options = {})
          register(
            key,
            intercept(key, options) { |value|
              value.is_a?(Date) ? value : DateTime.iso8601(value.to_s).to_date
            }
          )
        end
      end
    end
  end
end
