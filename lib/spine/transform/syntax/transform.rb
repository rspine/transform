module Spine
  module Transform
    module Syntax
      module Transform
        def transform(key, options = {}, &block)
          register(key, Commands::Transform.new(key, options, &block))
        end
      end
    end
  end
end
